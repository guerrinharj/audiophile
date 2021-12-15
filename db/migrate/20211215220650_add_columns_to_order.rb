class AddColumnsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :address, :string
    add_reference :orders, :cart, foreign_key: true
  end
end
