ActiveAdmin.register Faq do
  permit_params :question, :answer

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :question
      f.input :answer, as: :ckeditor
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
