ActiveAdmin.register Service do
  permit_params :name, :description, :price, :image

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :image, as: :file
      # f.input :banner, :as => :file, :hint => f.image_tag(f.object.head_image.url(:medium))
    end
    actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
