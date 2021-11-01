class SessionsController < ApplicationController
  
  def new
  end

  def create
    success = verify_recaptcha(action: 'login', minimum_score: 0.5, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3'])
    checkbox_success = verify_recaptcha unless success
    if success || checkbox_success
      # Perform action
    else
      if !success
        @show_checkbox_recaptcha = true
      end
      render 'new'
    end
  end

  def destroy
  end
end
