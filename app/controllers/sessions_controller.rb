class SessionsController < ApplicationController

    def new
    end

    def create
     
      @user = User.find_by(email: params[:email])

      if @user&.authenticate(params[:password])
        # Successful login
        session[:user_id] = @user.id
        flash[:notice] = 'User logged in succesfully'
        redirect_to root_path, notice: 'Logged in successfully.'
      else
        # Failed login
        flash.now[:alert] = 'Invalid email or password.'
        render "pages/log_in", status: :unprocessable_entity
      end


    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out successfully.'
      end

     
end
