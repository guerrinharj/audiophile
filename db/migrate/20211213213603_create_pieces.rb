class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.integer :quantity
      t.timestamps
    end
  end
end
