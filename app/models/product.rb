class Product < ActiveRecord::Base
  has_many :order_items
  has_one :product_type

  has_one_attached :image


  default_scope { where(active: true) }
end
