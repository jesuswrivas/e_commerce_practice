class Category < ApplicationRecord
    has_many :products





    def self.get_items_by_category(category_id,int)
        category = Category.find_by(id: category_id)
        if category
            category.products.order(id: :desc).limit(int)
        else
            []
        end
    end
   


end
