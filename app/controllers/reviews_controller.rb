class ReviewsController < ApplicationController


    def new
        @review = Review.new
        @purchase_product = PurchaseProduct.find_by(id: params[:purchase_product_id]) 

    
    end

    def create
        @user = current_user
        @purchase_product = PurchaseProduct.find_by(id: params[:purchase_product_id]) 


        ActiveRecord::Base.transaction do
            @review = Review.new(rating_params.merge(user_id: @user.id, product_id: @purchase_product.product.id ))

            if @review.save
                @purchase_product.review_id = @review.id
                @purchase_product.save!
                flash[:notice] = "Review completed succesfully"                
            else
                flash[:alert] = "Failed to save review"
                raise ActiveRecord::Rollback
            end
         end
         redirect_to user_profile_path(current_user.id)
    end


    
    private

    def rating_params
        params.require(:review).permit(:rating, :title, :comment)
    end


end
