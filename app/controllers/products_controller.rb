class ProductsController < ApplicationController
  def searchview
  end
  def search
    @name = params[:name]
    #@products = Products.where("product_name like ?", "%#{params[:name]}%")
  end
end
