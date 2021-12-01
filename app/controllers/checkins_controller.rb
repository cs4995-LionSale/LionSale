class CheckinsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    transcation = Transaction.find_by_id(checkin_params[:transaction_id])
    if current_user == transcation.seller then
      @checkin = transcation.seller_checkins.build(checkin_params)
    else
      @checkin = transcation.buyer_checkins.build(checkin_params)
    end
    render json: @checkin.as_json(only: [:lat, :lng, :transaction_id, :created_at]) if @checkin.save
  end
  
  private
    def checkin_params
      params.permit(:transaction_id, :lat, :lng)
    end
end