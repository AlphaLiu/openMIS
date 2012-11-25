class Product < ActiveRecord::Base
  attr_accessible :product_name, :stored_count, :unit, :purchase_price, :sell_price
end
