class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :paymentmethod, :string
    add_column :orders, :name, :string
    add_column :orders, :mobile, :string
    add_column :orders, :address, :string
  end
end
