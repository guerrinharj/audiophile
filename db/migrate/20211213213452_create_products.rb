class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :slug
      t.string :name
      t.string :image
      t.boolean :new, default: false
      t.integer :price
      t.text :description
      t.text :features
      t.string :galery_array, array: true, default: []
      t.timestamps
    end
  end
end
