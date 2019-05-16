ActiveAdmin.register Product do
  permit_params :name, :price, :active, :image, :product_type_id, properties_attributes: [:id, :name, :value]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors
    f.inputs do
      f.input :product_type
      f.input :name
      f.input :price
      f.input :active
      f.input :image, as: :file
      # f.input :banner, :as => :file, :hint => f.image_tag(f.object.head_image.url(:medium))
    end
    f.has_many :properties,
               allow_destroy: true do |prop|
      prop.input :name, as: :select, collection: ["Сечение", "Длина", "Сорт", "Ед. измерения"], include_blank: false
      prop.input :value
    end
    actions
  end
end
