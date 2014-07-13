class Product < ActiveRecord::Base
  has_many :prices
  has_one :current_price, class_name: 'Price'
  has_many :order_items
end
