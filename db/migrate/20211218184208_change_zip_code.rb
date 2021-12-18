class ChangeZipCode < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :zipcode, :string
  end
end
