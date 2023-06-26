class TransactionsController < ApplicationController

    def new
        @user = User.find_by(id: session[:user_id])
        @cart_items = CartItem.where(cart_id: @user.cart.id)
        @subtotal = cart_subtotal

    end


    def create
        @user = User.find_by(id: session[:user_id])
        @cart_items = CartItem.where(cart_id: @user.cart.id)
        @subtotal = cart_subtotal
        @new_transaction = Transaction.new(user_id: @user.id)

        Transaction.transaction do
          if @new_transaction.save
            @cart_items.each do |item|
                TransactionProduct.create!(purchased_transaction_id: @new_transaction.id, product_id: item.product.id)
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

    # def items_array_hash
    #     #[{trans_id:   product:_id : },{trans_id:   product:_id : },{trans_id:   product:_id : }]
    #     @cart_items.map do|item|
    #         {transaction_id: @new_transaction.id, product_id: item.product.id}
    #     end
    # end
end
