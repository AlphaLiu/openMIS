class ProductsController < ApplicationController
  def searchview
  end
  def search
    #@name = params[:name]
    #@products = Products.where("product_name like ?", "%#{params[:name]}%")
    name = params[:name]
    unless name.blank?
      @products = Product.where("Upper(product_name) like ?", "%#{params[:name]}%")
    else
      @products = []
    end
  end
end
