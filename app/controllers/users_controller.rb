class UsersController < ApplicationController

    def index
    end


    def show

    end


    def new
        @user = User.new
    end

    def create
        @user= User.new(user_params)
        

        if @user.save
            redirect_to home_path
        else
            flash[:alert] = "Please check the text fields for any error"
            render :new, status: :unprocessable_entity
        end


    end

    



    def edit

    end

    def update
    
    end


    def destroy

    end



    private

    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :role)
    end
    
end
