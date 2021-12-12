class SessionsController < ApplicationController
  def new
    @show_checkbox_recaptcha = false
  end

  def create
    success = verify_recaptcha(action: 'login', minimum_score: 0.5, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3'])
    checkbox_success = verify_recaptcha unless success 
    if success || checkbox_success
      user = User.find_by(email: params[:email].downcase) 
      if user && user.authenticate(params[:password]) && user.permission != -99    
      # login as user and redirect to user's profile 
        log_in user 
        params[:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
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
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
