class ProfilesController < ApplicationController

    def personal_info
        @user = current_user
    end

    def cards
    end

    def security
    end

    def addresses

    end

    def profile
        @user = current_user
    end

end
