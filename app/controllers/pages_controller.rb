class PagesController < ApplicationController


    def home
        @last_7_products = Product.order(id: :desc).limit(7)
    end

    def products
    end


    def about
    end


    def contact
    end
   

    def log_in
    end


end
