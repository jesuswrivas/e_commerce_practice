class CartsController < ApplicationController
    def show
      @user = current_user
      @cart_items = @user.cart.cart_items
      @subtotal = @user.cart.subtotal
    end
  

  
  end
  