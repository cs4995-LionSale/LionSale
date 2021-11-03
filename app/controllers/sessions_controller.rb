class SessionsController < ApplicationController
  def create
    success = verify_recaptcha(action: 'login', minimum_score: 0.5, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3'])
    checkbox_success = verify_recaptcha unless success
    if success || checkbox_success
      user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])    
    # login as user and redirect to user's profile 
      log_in user 
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Email or Password is incorrect, please try again' 
      render 'new'
    end
    else
      if !success
        @show_checkbox_recaptcha = true
      end
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
