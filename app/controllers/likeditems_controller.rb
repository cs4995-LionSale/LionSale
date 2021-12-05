class LikeditemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    item = Item.find_by_id(params[:item_id])
    if item then
      @likeditem = Likeditem.new(user:current_user,item:item)
      if @likeditem.save then
        flash[:success] = "Like this item successfully."
        redirect_to @likeditem.item
      else
        flash[:error] = "Fail to like this item."
        redirect_to item
      end
    else
      flash[:error] = "Invalid item"
      redirect_to items_url
    end
  end

  def destroy
    @likeditem = Likeditem.destroy_by(user_id:current_user.id,item_id:params[:item_id])
    if @likeditem.length > 0 then
      redirect_to @likeditem[0].item
    else
      redirect_to items_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_likeditem
      @likeditem = Likeditem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def likeditem_params
      params.require(:likeditem).permit(:item_id)    
    end
end
