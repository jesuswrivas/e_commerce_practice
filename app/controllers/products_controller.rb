class ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def create
    
    p params
        @product = Product.new(product_params)
        if @product.save
            redirect_to home_path
        else
            flash[:alert] = "Please check the text fields for any error"
            render :new, status: :unprocessable_entity
        end
    end
   
    private

    def product_params
        params.require(:product).permit(:name, :price, :description, :image, :category_id)
    end



end


