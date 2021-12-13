class RemoveProductPiecesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :product_pieces
  end
end
