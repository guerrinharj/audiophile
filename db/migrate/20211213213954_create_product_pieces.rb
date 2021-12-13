class CreateProductPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :product_pieces do |t|
      t.references :piece, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
