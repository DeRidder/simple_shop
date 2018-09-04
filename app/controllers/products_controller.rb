class ProductsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products
  end
end
