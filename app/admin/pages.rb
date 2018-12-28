ActiveAdmin.register Page do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :title, :body

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :name, collection: ['about', 'catalog', 'calculator', 'delivery' ]
      end
      f.input :title
      f.input :body, as: :ckeditor
    end
    actions
  end

  show do |page|
    row :name
  end


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
