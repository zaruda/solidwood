ActiveAdmin.register ProductType do
  permit_params :name, :description, :price, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
    end
    actions
  end

end
