class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @item = Item.find(params[:item_id])
  end

  # GET /transactions/new
  def new
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    if @item.quantity >= transaction_params[:quantity]
      @transaction = @item.transactions.build(transaction_params)
      @transaction.status = 100
      if @transaction.save
        @transaction.status = 110
        # detail transaction logic here
        
        
        if @item.change_stock(-1 * transaction_params[:quantity]) # decrease transaction's quantity from item's stock and save
          flash[:success] = "Transaction is successfully created"
          @transaction.status = 200
          redirect_to @transaction
        else
          flash[:fail] = "Error occurs while changing item's stock"
          @transaction.status = 121
          redirect_to @item
        end
      else 
        flash[:fail] = "Transaction request fails, please try again"
        @transaction.status = 111
        redirect_to @item
      end
    else
      flash[:fail] = "Item is out of stock"
      redirect_to @item
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    if @transaction.update(:item_id => transaction_params[:item_id], :seller_id => transaction_params[:seller_id], :buyer_id => transaction_params[:buyer_id], 
      :expected_deal_time => transaction_params[:expected_deal_time], :real_deal_time => transaction_params[:real_deal_time], :deal_address => transaction_params[:deal_address], 
      :deal_price => transaction_params[:deal_price], :status => transaction_params[:status], :seller_rating => transaction_params[:seller_rating], :buyer_rating => transaction_params[:buyer_rating])
      @transaction.status = 300
      flash[:success] = "Transaction profile is successfully updated"
      redirect_to @transaction
    else
      redirect_to @transaction
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
      params.require(:transaction).permit(:item_id, :seller_id, :buyer_id, :expected_deal_time, :real_deal_time, :deal_address, :deal_price, :status, :seller_rating, :buyer_rating)
    end
end
