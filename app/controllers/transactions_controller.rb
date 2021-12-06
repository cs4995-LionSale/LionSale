class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions_as_seller = Transaction.where(seller:current_user)
    @transactions_as_buyer = Transaction.where(buyer:current_user)
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @item = Item.find_by_id(params[:item_id])
    @transaction = Transaction.new
    # session[:item_id] = @item.id
    # session[:buyer_id] = params[:buyer_id]
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @item = Item.find_by_id(params[:item_id])
    #@transaction = Transaction.new
    @transaction = @item.transactions.build(transaction_params)
    @transaction.buyer = current_user
    @transaction.seller = @item.seller
    @transaction.status = 110
    @transaction.quantity = transaction_params[:quantity]
    @transaction.deal_price = @transaction.quantity * @item.price
    @transaction.expected_deal_time = transaction_params[:expected_deal_time]
    @transaction.save
    if @item.status == 0 && @item.stock >= @transaction.quantity 
      @item.change_stock(-1 * @transaction.quantity, 0)  # stage 0 is at create transaction, stage 1 is at update transaction
      flash[:success] = "Transaction successfully created!"  
    else
      flash[:fail] = "Transaction creation fails due to insufficient stock"
    end
    
    render 'show'
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    @item = Item.find_by_id(@transaction.item_id)
    if current_user == @transaction.seller # current user is seller
      if @transaction.status == 110 # buyer successfully create purchase request
        @transaction.status = params[:status]
        @transaction.save
        if (@transaction.status == 120) # seller agrees the purchase request
          @transaction.status = 200 # system passes seller's agreement of purchase request, wait for deal confirm
          @transaction.save
          flash[:success] = "Seller agrees the purchase request"
          render 'show'
        else # seller rejects the purchase request
          @transaction.status = 121 # consequently seller rejects purchase request
          @transaction.save
          @item.stock += @transaction.quantity
          @item.status = @item.stock > 0 ? 0 : 20
          @item.save
          flash[:fail] = "Seller rejects the purchase request"
          render 'show'
        end
      elsif @transaction.status == 210 # buyer successfully confirm deal
        @transaction.status = params[:status]
        @transaction.save
        if @transaction.status == 220 # seller confirms buyer's deal confirm 
          if Geocoder::Calculations.distance_between(@transaction.seller_checkin_latest, @transaction.buyer_checkin_latest,:units => :km) < 1 then
            flash[:success] = "Transaction is successfully confirmed by seller"
            @transaction.real_deal_time = Time.now
            @transaction.status = 0
            @transaction.seller_rating = params[:seller_rating]
            @transaction.save
          else
            flash[:danger] = "Please be closer to make a deal"
            @transaction.status = 210
            @transaction.save
          end
        else #transaction.status == 222, seller cancels buyer's deal confirm
          @item.stock += @transaction.quantity
          @item.status = @item.stock > 0 ? 0 : 20
          @item.save
          flash[:fail] = "Transaction is cancelled by seller"
        end
        render 'show'
      else # @transaction.status is 112 due to buyer's cancellation
        flash[:fail] = "Buyer cancells purchase request"
        render 'show'
      end
    else # current user is buyer
      if @transaction.status == 110   # purchase request is waiting for response, the only button for buyer now is cancel it          
        @transaction.status = params[:status]
        @transaction.save
        @item.stock += @transaction.quantity
        @item.status = @item.stock > 0 ? 0 : 20
        @item.save
        flash[:success] = "Purchase request is cancelled by buyer"
        render 'show'
      elsif @transaction.status == 200 # seller agrees the purchase request and wait for deal confirm
        @transaction.status = params[:status]
        @transaction.save
        if @transaction.status == 201 # buyer confirm deal
          if Geocoder::Calculations.distance_between(@transaction.seller_checkin_latest, @transaction.buyer_checkin_latest,:units => :km) < 1 then
            # decrease transaction's quantity from item's stock and save, @item.change_stock(-1 * @transaction.quantity, 0), 
            # stage 0 is at create transaction, stage 1 is at update transaction 
            if @item.change_stock(-1 * @transaction.quantity, 1) 
              flash[:success] = "Transaction is successfully updated by buyer"
              @transaction.status = 210
              @transaction.buyer_rating = params[:buyer_rating]
              @transaction.save
            else 
              flash[:fail] = "Error occurs when buyer changes confirms deal"
              @transaction.status = 211
              @transaction.save
            end
          else
            flash[:danger] = "Please be closer to make a deal"
            @transaction.status = 200
            @transaction.save
          end
          render 'show'

        else # @transaction.status = 213, buyer cancels deal confirmation
          @item.stock += @transaction.quantity
          @item.status = @item.stock > 0 ? 0 : 20
          @item.save
          flash[:fail] = "Buyer cancels the deal confirmation"
          render 'show'
        end
        
      else # @transaction.status is 121, seller rejects the purchase request, deal ends
        flash[:fail] = "Seller declines your purchase request"
        render 'show'
      end
    end

  end

  # DELETE /transactions/1 or /transactions/1.json
  # def destroy
  #   destroyedTransaction = Transaction.find(params[:id])
  #   destroyedTransaction.status = 112
  #   destroyedTransaction.save
  #   flash[:success] = "Transaction has been canceled"
  #   redirect_to @item
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:item_id, :seller_id, :buyer_id, :expected_deal_time, :real_deal_time, :deal_address, :deal_price, :status, :seller_rating, :buyer_rating, :quantity)
    end
end
