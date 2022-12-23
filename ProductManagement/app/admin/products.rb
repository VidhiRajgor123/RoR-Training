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
      f.input :image, as: :file, required: false, :hint => f.template.image_tag(f.object.image.url(:thumb))
      if (f.object.image.present?)
        f.input :remove_image, :as=> :boolean, :required => false, :label => 'Remove Image'
      end
    end
    f.actions
  end

  index do
    selectable_column
      column :name
      column :price
      column :description
      column :active
      column :image do |img|
        link_to image_tag(img.image.thumb.url,width:100,height:80), img.image.url,  target: :_blank 
      end
      column :created_at
      column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :active
      row :image do 
        link_to image_tag(product.image.thumb.url,width:100,height:80), product.image.url,  target: :_blank 
      end
      row :created_at
      row :updated_at
    end
  end                                         
  
end
