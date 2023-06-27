class Product < ApplicationRecord
    has_many :reviews
    belongs_to :category
    has_one_attached :image
  
    has_many :cart_items
    has_many :carts, through: :cart_items


    has_many :purchase_products
    has_many :purchases, through: :purchase_products

    # validations
    validates :image, presence: true
    validates :name, presence: true
    validates :price, presence: true,  numericality: { greater_than_or_equal_to: 0}
    validates :description_1, presence: true
    validates :quantity, presence: true
    validates :brand, presence: true


    def decrement_stock(qty_sold)
        self.quantity -= qty_sold
        if self.save
            p "#{qty_sold} has been moved out from #Item: #{self.id} stock"
        else
            p "Error, something happened."
        end
    end


    def bought_by_user?(user)
        join_table = PurchaseProduct.joins(:purchase).select('purchase_products.*, purchases.user_id').where(product_id: self.id)
        join_table.any? do |object|
            object.user_id == user.id
        end

    end
  

end

