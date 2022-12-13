ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :description, :active, :image

  form do |f|
    f.inputs do 
      f.input :name
      f.input :price
      f.input :description
      f.input :active
      f.input :image, as: :file
    end
    f.actions
  end
  
end
