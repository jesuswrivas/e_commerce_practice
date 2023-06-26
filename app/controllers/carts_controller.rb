class CartsController < ApplicationController
    def show
      @user = User.find_by(id: session[:user_id])
      @products = @user.cart.products
      @subtotal = cart_subtotal
    end
  
    private
  
    def cart_subtotal
      subtotal = 0
      @products.each do |product|
        subtotal += product.price
      end
      subtotal
    end
  end
  