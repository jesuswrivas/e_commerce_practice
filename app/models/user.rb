class User < ApplicationRecord
    has_many :reviews

    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    enum role: [:user, :admin]
  
    has_secure_password

end


