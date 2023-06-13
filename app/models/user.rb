class User < ApplicationRecord
    has_many :reviews

    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
    has_secure_password

end


