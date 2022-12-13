class ProductsController < ApplicationController
    def index
        @products = Product.where(:active => 1)
    end

    def show
        @product = Product.find(params[:id])
        render :detail
    end
end
