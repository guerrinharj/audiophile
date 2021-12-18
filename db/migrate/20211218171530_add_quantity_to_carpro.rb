class AddQuantityToCarpro < ActiveRecord::Migration[6.0]
  def change
    add_column :carpros, :quantity, :integer
  end
end
