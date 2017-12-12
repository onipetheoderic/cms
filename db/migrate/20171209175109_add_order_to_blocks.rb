class AddOrderToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :order, :integer
  end
end
