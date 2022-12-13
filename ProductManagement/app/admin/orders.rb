ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :total_amount, :total_qty, :status, :order_date, :paymentmethod, :name, :mobile, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :total_amount, :total_qty, :status, :order_date, :paymentmethod, :name, :mobile, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
