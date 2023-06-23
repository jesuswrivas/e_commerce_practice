class CartItemsController < ApplicationController


    def new

    end

    def create
        
        @user = User.find_by(id: (session[:user_id]))
        @cart = @user.cart
        @product_id = cart_item_params[:product_id]
        @product = Product.find_by(id: @product_id)
        
        #Server side validation 
        #Case 1: The quantity attribute is 0
        if  @product.quantity == 0
            flash[:alert] = "Something went wrong. Item out of stock"
            redirect_to product_path(cart_item_params[:product_id]) and return
        end

        #Case 2: The form field (quantity) is greater than the Product quantity attribute
        if cart_item_params[:quantity].to_i > @product.quantity
            flash[:alert] = "Something went wrong. Not enough in stock"
            redirect_to product_path(cart_item_params[:product_id]) and return
        end

        @new_cart_item = CartItem.new(cart_item_params.merge(cart_id: @cart.id))

        if @new_cart_item.save
            flash[:notice] = "Item added to the cart"
        else
            flash[:alert] = "Please check the text fields for any error"
        end
        redirect_to product_path(cart_item_params[:product_id])
  
    end

    def destroy
        @cart_item = CartItem.find_by(id: params[:id])
       
        if @cart_item.destroy
            flash[:notice] = "Item removed from cart."
        else
            flash[:alert] = "Item not found in cart."
        end
        # redirect to an appropriate path
        redirect_to cart_path(@cart)
    end
   
        private

        def cart_item_params
            params.require(:cart_item).permit(:quantity, :product_id)
        end



   

end
