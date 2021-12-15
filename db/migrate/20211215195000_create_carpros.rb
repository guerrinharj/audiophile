class CreateCarpros < ActiveRecord::Migration[6.0]
  def change
    create_table :carpros do |t|
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
