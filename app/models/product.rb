class Product < ApplicationRecord
    has_many :reviews
    belongs_to :category
    has_one_attached :image
    has_and_belongs_to_many :carts
    
    validates :image, presence: true
    validates :name, presence: true
    validates :price, presence: true,  numericality: { greater_than_or_equal_to: 0}
    validates :description_1, presence: true
    validates :quantity, presence: true
    validates :brand, presence: true

end

