class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.where(seller:current_user).or(Transaction.where(buyer:current_user))
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    if @transaction.status == 110 # seller successfully receive buyer's purchase request
      render 'show' # render transaction show page for later update
    end
  end

  # GET /transactions/new
  def new
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
    session[:item_id] = @item.id
    session[:buyer_id] = params[:buyer_id]
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @item = Item.find(session[:item_id])
    #@transaction = Transaction.new
    @transaction = @item.transactions.build(transaction_params)
    @transaction.buyer = User.find(session[:buyer_id])
    @transaction.seller = @item.seller
    @transaction.status = 110
    @transaction.quantity = transaction_params[:quantity]
    @transaction.deal_price = transaction_params[:quantity] * @item.price
    @transaction.save
    flash[:success] = "Transaction successfully created!"
    render 'show'
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    @transaction.update(:item_id => transaction_params[:item_id], :seller_id => transaction_params[:seller_id], :buyer_id => transaction_params[:buyer_id], 
      :expected_deal_time => transaction_params[:expected_deal_time], :real_deal_time => transaction_params[:real_deal_time], :deal_address => transaction_params[:deal_address], 
      :deal_price => transaction_params[:deal_price], :status => transaction_params[:status], :seller_rating => transaction_params[:seller_rating], :buyer_rating => transaction_params[:buyer_rating], 
      :quantity => transaction_params[:quantity])
      
      





      
      if current_user == @transaction.seller # current user is seller
        if @transaction.update(:item_id => transaction_params[:item_id], :seller_id => transaction_params[:seller_id], :buyer_id => transaction_params[:buyer_id], 
          :expected_deal_time => transaction_params[:expected_deal_time], :real_deal_time => transaction_params[:real_deal_time], :deal_address => transaction_params[:deal_address], 
          :deal_price => transaction_params[:deal_price], :status => transaction_params[:status], :seller_rating => transaction_params[:seller_rating], :buyer_rating => transaction_params[:buyer_rating], 
          :quantity => transaction_params[:quantity])
          flash[:success] = "Transaction is successfully updated by seller"
        else
          flash[:fail] = "Error occurs when seller changes item's stock"
          @transaction.status = 371
        end
        @transaction.save
        render 'show'
      else # current user is buyer
        if @item.quantity >= transaction_params[:quantity]
          # detail transaction logic here  
          
          if @transaction.update(:item_id => transaction_params[:item_id], :seller_id => transaction_params[:seller_id], :buyer_id => transaction_params[:buyer_id], 
            :expected_deal_time => transaction_params[:expected_deal_time], :real_deal_time => transaction_params[:real_deal_time], :deal_address => transaction_params[:deal_address], 
            :deal_price => transaction_params[:deal_price], :status => transaction_params[:status], :seller_rating => transaction_params[:seller_rating], :buyer_rating => transaction_params[:buyer_rating], 
            :quantity => transaction_params[:quantity])
            @item.change_stock(-1 * transaction_params[:quantity]) # decrease transaction's quantity from item's stock and save
            flash[:success] = "Transaction is successfully updated by buyer"
          else 
            flash[:fail] = "Error occurs when buyer changes item's stock"
            @transaction.status = 311
          end
          @transaction.save
          render 'show'
        else
          flash[:fail] = "Item in stock is insufficient, please choose a smaller quantity"
          render 'show'
        end
      end

  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    destroyedTransaction = Transaction.find(params[:id])
    destroyedTransaction.status = 112
    destroyedTransaction.save
    flash[:success] = "Transaction has been canceled"
    redirect_to @item
  end

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
