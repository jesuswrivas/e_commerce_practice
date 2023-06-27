class PurchasesController < ApplicationController

    def new
      @user = User.find_by(id: session[:user_id])
      @cart_items = CartItem.where(cart_id: @user.cart.id)
      @subtotal = @user.cart.subtotal
    end


    def create
      @user = User.find_by(id: session[:user_id])
      @cart_items = CartItem.where(cart_id: @user.cart.id)
      @subtotal = @user.cart.subtotal

      @new_purchase = Purchase.create_purchase_from_cart(@user, @cart_items)
      
      if @new_purchase
        flash[:notice] = "Purchase confirmed"  
        @user.cart.empty_cart
      else
        flash[:alert] = "Something went wrong"
      end
      redirect_to root_path
    end



    def index
      @user = User.find_by(id: session[:user_id])
      @purchase_list = @user.get_all_purchase_products  
    end
         

end
