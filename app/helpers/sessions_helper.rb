module SessionsHelper
    # login to specific user
    def log_in(user)
      if (user.permission != -99)
        session[:user_id] = user.id  
      end
    end
  
    #return current user's object, if nil, find session recorded user
    def current_user
      if (user_id = session[:user_id]) 
          @current_user ||= User.find_by(id: user_id) 
      elsif (user_id = cookies.signed[:user_id]) 
        user = User.find_by(id: user_id) 
        if user && user.permission != -99 && user.authenticated?(cookies[:remember_token]) 
          log_in user 
          @current_user = user 
        end 
      end  
    end
  
    #return true if user has logged in, otherwise, return false
    def logged_in?
      if @current_user == nil || @current_user.permission == -99
        return false
      else
        return true 
      end 
    end
  
    #remember user in long session
    def remember(user)
      user.remember 
      cookies.permanent.signed[:user_id] = user.id 
      cookies.permanent[:remember_token] = user.remember_token  
    end
     
    # forget permanent session
    def forget(user)
      user.forget 
      cookies.delete(:user_id) 
      cookies.delete(:remember_token)  
    end
    
  
    #log out of current user
    def log_out
      forget(current_user)
      session.delete(:user_id) 
      @current_user = nil  
    end
    # return true if input user is the current user
  def current_user?(user)
    user == @current_user  
  end

  # redirect to storage address or default address
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default) 
    session.delete(:forwarding_url)  
  end
   
  # save address needed for later redirect
  def store_location
    session[:forwarding_url] = request.url if request.get?  
  end

  end