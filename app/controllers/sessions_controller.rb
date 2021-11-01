class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])    
    # login as user and redirec to user's profile 
      log_in user 
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Email or Password is incorrect, please try again' 
      render 'new'
    end
  end
  
  def new
  end
 
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
