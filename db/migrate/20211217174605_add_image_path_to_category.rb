class AddImagePathToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :image_url, :string, array: true, default: []
  end
end
