class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    private
       # make sure user must logged in before edit/update/delete operation
       def logged_in_user
         unless logged_in? 
           store_location
           flash[:danger] = "Please log in to continue editing and updating user information" 
           redirect_to login_url 
         end    
       end
end