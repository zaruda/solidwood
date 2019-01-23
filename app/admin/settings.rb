ActiveAdmin.register Setting do
  permit_params :bank, :email, :phone, :about, :address

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs do
      f.input :email
      f.input :phone
      f.input :bank
      f.input :address
      f.input :about, as: :ckeditor
    end
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
