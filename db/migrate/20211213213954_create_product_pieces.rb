class CreateProductPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :product_pieces do |t|

      t.timestamps
    end
  end
end
