class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.where(from: current_user).or(Message.where(to: current_user))
    if params[:item_id] != nil then
      @item = Item.find_by_id(params[:item_id].to_i)
      @message_groups = @messages.where(item: @item).group_by { |d| d[:item_id] }.map{|k,v| {'item': Item.find_by_id(k),'messages': v} }
    else
      @message_groups = @messages.group_by { |d| d[:item_id] }.map{|k,v| {'item': Item.find_by_id(k),'messages': v} }
    end
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @item = Item.find_by_id(params[:item_id].to_i)
    @message = Message.new
    @to = User.find_by_id(params[:to_id].to_i)
    @prev_messages = Message.where(item: @item)
    render 'new' 
  end

  # POST /messages or /messages.json
  def create
    @item = Item.find_by_id(message_params[:item_id])
    @message = Message.new
    @message.item = @item
    @message.from = current_user
    @message.to = User.find_by_id(message_params[:to_id])
    @message.content = message_params[:content]
    if @message.save then
      @message_groups = (Message.where(from: current_user).or(Message.where(to: current_user))).group_by { |d| d[:item_id] }.map{|k,v| {'item': Item.find_by_id(k),'messages': v} }
      render 'index'  
    else
      flash[:fail] = "The message is not sent successfully"
      @to = User.find_by_id(params[:to_id].to_i)
      render 'new'
    end
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:from_id, :to_id, :item_id, :content, :attachments)
    end
end
