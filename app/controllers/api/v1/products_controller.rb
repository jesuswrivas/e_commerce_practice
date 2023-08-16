

module Api
    module V1
      class ProductsController < ApplicationController
        skip_before_action :require_login
    
  
        def index
            @products = Product.all
            if params[:category]
                @products = @products.where(category: params[:category])
            end
            render json: @products.as_json(except: [:image])
        end

        def show
          @product = Product.find(params[:id])
          render json: @product.as_json(except: [:image])
        end
      end
    end
  end

