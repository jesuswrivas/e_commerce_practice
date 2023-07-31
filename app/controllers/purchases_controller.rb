class PurchasesController < ApplicationController

    def new
      @user = current_user
      @cart_items = CartItem.where(cart_id: @user.cart.id)
      @subtotal = @user.cart.subtotal
    end


    def create
      @user = current_user
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
      @user = current_user

      @purchase_list = @user.get_all_purchase_products.paginate(:page => params[:page], :per_page => 5)

    end
         

end
