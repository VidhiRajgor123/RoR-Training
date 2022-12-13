class RemoveStatus2From < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :status2, :integer
  end
end
