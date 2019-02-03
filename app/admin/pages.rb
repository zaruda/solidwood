ActiveAdmin.register Page do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :title, :description, :body

  index do
    selectable_column
    id_column
    column :name
    column :title
    column :description
    actions
  end

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :name, collection: ['Главная', 'Каталог', 'Калькулятор', 'Доставка и оплата', 'Контакты', 'Новости' ]
      end
      f.input :title
      f.input :description
      f.input :body, as: :ckeditor
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :description
      row :body
    end
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
