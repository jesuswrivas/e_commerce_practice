class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def index
    end


    def show

    end


    def new
        @user = User.new
    end

    def create
        @user= User.new(user_params)
        @profile = Profile.new(profile_params)

        
        respond_to do |format|
            if @user.save 
                @user.build_profile(name:@user.name, email:@user.email)
                @user.profile.save
                @user.build_cart
                @user.cart.save

                # Tell the UserMailer to send a welcome email after save
                UserMailer.with(user: @user).welcome_email.deliver_later

                redirect_to root_path, notice: "User created succesfully"
            else
                flash[:alert] = "Please check the text fields for any error"
                render :new, status: :unprocessable_entity
            end
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

    def profile_params
        profile_keys = ['name', 'email']
        filtered_params = user_params.select { |key, value| profile_keys.include?(key) }
        filtered_params
      end
      
end
