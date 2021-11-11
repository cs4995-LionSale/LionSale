class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    success = verify_recaptcha(action: 'login', minimum_score: 0.5, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3'])
    checkbox_success = verify_recaptcha unless success
    if success || checkbox_success
      if @user.save
        log_in @user      
        flash[:success] = "Welcome to LionSale!"
        redirect_to @user
      else
       render 'new'
      end
    else
      # Score is below threshold, so user may be a bot. Show a challenge, require multi-factor
      # authentication, or do something else.
      if !success
        @show_checkbox_recaptcha = true
      end
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    
  end

  # user 
  def login
    
  end

  def logout
  
  end

  def authenticate

  end  

  # DELETE /users/1 or /users/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :address, :rating_seller, :rating_buyer, :permission, :avatar)
    end

end