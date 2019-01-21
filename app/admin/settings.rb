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

end
