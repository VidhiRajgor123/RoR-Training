class AddStatus222ToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status2, :integer
  end
end
