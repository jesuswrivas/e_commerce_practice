class ApplicationController < ActionController::Base
    before_action :load_categories
    helper_method :current_user, :user_signed_in? 
    before_action :require_login

   
    private
  
    def load_categories
      @categories = Category.all
    end

  
 
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def user_signed_in?
      !current_user.nil?
    end

   

    def require_login
      unless user_signed_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to log_in_path 
      end
    end
    

    def user_admin?
      current_user.role == "admin"
    end

    def require_admin
      unless user_signed_in? && user_admin?
        flash[:alert] = "You are not authorized to perform this action"
        redirect_to root_path
      end
    end

    
  end

  