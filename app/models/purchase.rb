class Purchase < ApplicationRecord
   has_many :purchase_products
   has_many :products, through: :purchase_products



   def self.create_purchase_from_cart(user, cart_items)

      Purchase.transaction do
          new_purchase = Purchase.new(user_id: user.id)

          if new_purchase.save
              cart_items.each do |item|
                  new_purchase.purchase_products.create(product_id: item.id, item_qty: item.quantity ,item_price:item.product.price )
                  item.product.decrement_stock(item.quantity)
              end
          else
              raise ActiveRecord::Rollback
          end
      end
  end





end
