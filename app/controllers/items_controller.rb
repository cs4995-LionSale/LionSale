class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @category_list = []
    if params[:user_id]
      usr = User.find_by_id(params[:user_id].to_i)
      if usr
        @items = Item.where(seller_id:params[:user_id].to_i)
      else
        @items = Item.all
      end
    elsif params[:category_id]
      cat = Category.find_by_id(params[:category_id].to_i)
      if cat
        @items = Item.where(category:cat.get_sub_categories([]))
        @category_list = cat.get_category_path
      else
        @items = Item.all
      end
    elsif params[:show_liked] then
      @items = current_user.items_liked.map(&:item).flatten
    else
      @items = Item.all
    end
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
    @item = current_user.items_sold.build(item_params)
    @item.status = 0
    if @item.save
      flash[:success] = "Item is successfully created."
      redirect_to current_user
    else
      render 'new'
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if @item.update(:title => item_params[:title], :description => item_params[:description], :price => item_params[:price], :category_id => item_params[:category_id])
      if params[:item][:photos]
        params[:item][:photos].each do |photo|
          @item.photos.attach(photo)
        end
      end
      flash[:success] = "Item profile is successfully updated"
      redirect_to current_user
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
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :seller_id, :price, :created_at, :updated_at, :status, :category_id, :stock, photos:[])    
    end

    def correct_user
      redirect_to(root_url) unless current_user.permission != -99 
    end
end
