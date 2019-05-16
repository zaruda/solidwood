ActiveAdmin.register ProductType do
  permit_params :name, :description, :meta_description, :meta_title, :price, :image

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
    f.semantic_errors

    f.inputs 'Контент' do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :price
      f.input :image, as: :file
    end
    f.inputs 'SEO' do
      f.input :meta_title
      f.input :meta_description
    end
    actions
  end

end
