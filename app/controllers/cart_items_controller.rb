class CartItemsController < ApplicationController

    def create
        @user = User.find_by(id: (session[:user_id]))
        @cart = @user.cart
        @product = Product.find_by(id: params[:product_id])
        @cart.products << @product

        if @cart.save
            flash[:notice] = "Item added to the cart"
            redirect_to product_path(@product)
        else
            flash[:alert] = "Please check the text fields for any error"
            redirect_to product_path(@product)
        end

    end

    def destroy
        @cart = Cart.find_by(id: params[:id])
        @product = Product.find_by(id: params[:product_id])
        

        if @cart.products.delete(@product)
            flash[:notice] = "Item removed from cart."
        else
            flash[:alert] = "Item not found in cart."
        end
        # redirect to an appropriate path
        redirect_to cart_path(@cart)
    end

end
