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

  def index
    @products = Product.all #should not use all in real project
  end
end
