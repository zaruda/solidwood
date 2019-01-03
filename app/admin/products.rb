ActiveAdmin.register Product do
  permit_params :name, :size, :quality, :price, :active, :image, :product_type_id


  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :product_type_id
      f.input :name
      f.input :size
      f.input :quality
      f.input :price
      f.input :active
      f.input :image, :as => :file
      # f.input :banner, :as => :file, :hint => f.image_tag(f.object.head_image.url(:medium))
    end
    actions
  end


end
