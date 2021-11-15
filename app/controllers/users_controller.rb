class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]  
  before_action :correct_user,   only: [:edit, :update] 
  before_action :admin_user,     only: :destroy 
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @items_sold = @user.items_sold
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
    if @user.update(:email => user_params[:email], :username => user_params.[:username], :avatar_url => user_params[:avatar_url], :address => user_params[:address])      # 处理更新成功的情况
      flash[:success] = "User profile successfully updated" 
      redirect_to @user
    else
      render 'edit'
    end
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
    deletedUser = User.find(params[:id])
     deletedUser.permission = -99
     deletedUser.save
     flash[:success] = "User deleted" 
     redirect_to users_url  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      targetUser = User.find(params[:id])
       if (targetUser == nil || targetUser.permission != -99)
         @user = targetUser
       end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :address, :rating_seller, :rating_buyer, :permission, :avatar)
    end

    
    # guarantee the current user's identity is correct
    def correct_user
      @user = User.find(params[:id]) 
      redirect_to(root_url) unless @user.permission != -99 && current_user?(@user)
    end

    # identify administrator
    def admin_user
      redirect_to(root_url) unless @user.permission > 0    # user.permission = 99 if it is an admin 
    end

end