class TypeProperty < ApplicationRecord
  belongs_to :property
  belongs_to :product_type
end
