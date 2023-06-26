class PurchasesController < ApplicationController

    def new
        @user = User.find_by(id: session[:user_id])
        @cart_items = CartItem.where(cart_id: @user.cart.id)
        @subtotal = cart_subtotal

    end


    def create
        @user = User.find_by(id: session[:user_id])
        @cart_items = CartItem.where(cart_id: @user.cart.id)
        @subtotal = cart_subtotal
        @new_purchase = Purchase.new(user_id: @user.id)

        Purchase.transaction do
          if @new_purchase.save
            @cart_items.each do |item|
                PurchaseProduct.create!(purchase_id: @new_purchase.id, product_id: item.product.id)
            end
          else
            flash[:alert] = "Something went wrong"
            raise ActiveRecord::Rollback
          end
        end
      
        redirect_to root_path

      end
      


    private
  
    def cart_subtotal
      subtotal = 0
      @cart_items.each do |item|
        subtotal += (item.quantity)*item.product.price
      end
      subtotal
    end

end
