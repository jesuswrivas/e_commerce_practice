class Transaction < ApplicationRecord
   has_many :transaction_products
   has_many :products, through: :transaction_products

end
