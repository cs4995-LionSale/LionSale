class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
    @category_list = category_list()
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = @user.items_sold.build(item_params)
    @item.status = 0
    if @item.save
      flash[:success] = "Item is successfully created."
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if @item.update(:title => item_params[:title], :description => item_params[:description], :seller_id => item_params[:seller_id], :price => item_params[:price], 
      :created_at => item_params[:created_at], :updated_at => item_params[:updated_at], :status => item_params[:status], :category_id => item_params[:category_id], :picture => item_params[:picture])
      flash[:success] = "Item profile is successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    destroyedItem = Item.find(params[:id])
    destroyedItem.status = 50
    destroyedItem.save
    flash[:success] = "Item selling has been stopped"
    redirect_to @user
  end

  def category_list
    return []
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :seller_id, :price, :created_at, :updated_at, :status, :category_id, :picture)    
    end

    def correct_user
      @item = current_user.items_sold.find_by(id: params[:id]) 
      redirect_to items_url if @item.nil?    
    end
end
