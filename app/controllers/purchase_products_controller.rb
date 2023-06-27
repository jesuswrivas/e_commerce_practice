class PurchaseProductsController < ApplicationController

    def index
        @purchase = Purchase.find_by(id: params[:purchase_id])
        p @purchase


    end


end
