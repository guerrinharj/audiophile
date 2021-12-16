class AddMoreColumnsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :email, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :zipcode, :integer
    add_column :orders, :city, :string
    add_column :orders, :country, :string
    add_column :orders, :emoney_number, :integer
    add_column :orders, :emoney_pin, :integer
  end
end
