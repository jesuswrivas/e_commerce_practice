class ProfilesController < ApplicationController

    def personal_info
        @user = User.find_by(id:(session[:user_id]))
    end

    def cards
    end

    def security
    end

    def addresses

    end

    def profile
    end

end
