class CartsController < ApplicationController
    def show
        @user = User.find_by(id: session[:user_id])
        @products = @user.cart.products

    end
end

