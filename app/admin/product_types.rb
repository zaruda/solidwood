ActiveAdmin.register ProductType do
  permit_params :name, :description, :price, :image

  index do
    selectable_column
    id_column
    column :name
    column :price
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :image do |pt|
        if pt.image.attached? and Rails.env.production?
          image_tag pt.image.service_url, class: 'img-responsive'
        end
      end
      row :description do |pt|
        raw(pt.description)
      end
    end
    active_admin_comments
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :price
      f.input :image, as: :file
    end
    actions
  end

end
