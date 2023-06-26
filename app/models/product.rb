class Product < ApplicationRecord
    has_many :reviews
    belongs_to :category
    has_one_attached :image
  
    has_many :cart_items
    has_many :carts, through: :cart_items


    has_many :transaction_products
    has_many :purchased_transactions, through: :transaction_products, source: :purchased_transaction


    # validations
    validates :image, presence: true
    validates :name, presence: true
    validates :price, presence: true,  numericality: { greater_than_or_equal_to: 0}
    validates :description_1, presence: true
    validates :quantity, presence: true
    validates :brand, presence: true

end

