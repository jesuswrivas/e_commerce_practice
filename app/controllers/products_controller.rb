class ProductsController < ApplicationController

    def show
        @user = User.find_by(id: session[:user_id])
        @new_cart_item = CartItem.new
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
        p "Nothing yet"
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
        params.require(:product).permit(:name, :price, :description_1, :image, :category_id, :quantity, :description_2, :brand)
    end



end


