module SessionsHelper
    # login to specific user
    def log_in(user)
      session[:user_id] = user.id  
    end
  
    #return current user's object, if nil, find session recorded user
    def current_user
      if (user_id = session[:user_id]) 
          @current_user ||= User.find_by(id: user_id) 
      elsif (user_id = cookies.signed[:user_id]) 
        user = User.find_by(id: user_id) 
        if user && user.authenticated?(cookies[:remember_token]) 
          log_in user 
          @current_user = user 
        end 
      end  
    end
  
    #return true if user has logged in, otherwise, return false
    def logged_in?
      if current_user == nil
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
    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
   raise       # 测试仍能通过，所以没有覆盖这个分支      user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end

    # 返回 cookie 中记忆令牌对应的用户
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
 elsif (user_id = cookies.signed[:user_id])      
  user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
    #log out of current user
    def log_out
      forget(current_user)
      session.delete(:user_id) 
      @current_user = nil  
    end
  end