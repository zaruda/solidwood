ActiveAdmin.register Setting do
  permit_params :bank, :email, :phone, :second_phone, :about, :address, :pricelist,
                :application_scope_content, :our_products_content, :about_lumber_content

  form html: { enctype: "multipart/form-data" } do |f|
    f.semantic_errors

    f.inputs do
      f.input :email
      f.input :phone
      f.input :second_phone
      f.input :bank
      f.input :address
      f.input :about_lumber_content, as: :ckeditor
      f.input :application_scope_content, as: :ckeditor
      f.input :our_products_content, as: :ckeditor
      f.input :about, as: :ckeditor
      f.input :pricelist, as: :file
    end
    actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :phone
    column :bank
    column :address
    actions
  end

  show do
    attributes_table do
      row :email
      row :phone
      row :bank
      row :address
      row :about do |setting|
        raw(setting.about)
      end
    end
    active_admin_comments
  end


end
