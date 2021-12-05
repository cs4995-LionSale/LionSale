class CheckinsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    transaction = Transaction.find_by_id(checkin_params[:transaction_id])
    @checkin = Checkin.create!({
      transaction:transaction,
      user:current_user,
      lat:checkin_params[:lat],
      lng:checkin_params[:lng]
    })
  end
  
  private
    def checkin_params
      params.permit(:transaction_id, :user_id, :lat, :lng)
    end
end