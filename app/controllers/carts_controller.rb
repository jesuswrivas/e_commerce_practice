class CartsController < ApplicationController
    def show
      @user = User.find_by(id: session[:user_id])
      @cart_items = @user.cart.cart_items
      @subtotal = @user.cart.subtotal
    end
  

  
  end
  