class ProductsController < ApplicationController

    def show
        @product = Product.find_by(id: params[:id])
        @latest_5_category_products = Product.where(category: @product.category).order(id: :desc).limit(5)
        @latest_5_reviews = Review.where(product_id: @product.id).order(id: :desc).limit(5)
          
    end

    def index
        # for all categories
        @category = Category.find_by(id:(params[:category_id]))

        if @category
            @products = @category.products  

        #for all products no matter the categories
        else
        


        end
        
    end


    def new
        @product = Product.new
    end

    def create

        @product = Product.new(product_params)
        if @product.save
            redirect_to home_path
        else
            render :new, status: :unprocessable_entity
        end
    end
   
    private

    def product_params
        params.require(:product).permit(:name, :price, :description, :image, :category_id)
    end



end


