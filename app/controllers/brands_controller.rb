class BrandsController < ApplicationController
  def index
    @brands = Brand.includes(:products)
  end
end
