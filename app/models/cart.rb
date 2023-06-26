class Cart < ApplicationRecord
    
    has_many :cart_items
    has_many :products, through: :cart_items
    
    belongs_to :user




    def subtotal

        subtotal = 0

        self.cart_items.each do |item|
            subtotal += item.quantity + item.product.price
        end

        return subtotal
    end

       


end
