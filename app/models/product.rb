class Product < ActiveRecord::Base
  belongs_to :product_type
  has_many :order_items
  has_and_belongs_to_many :properties

  accepts_nested_attributes_for :properties, allow_destroy: true

  has_one_attached :image


  default_scope { where(active: true) }
end
