class AddPieceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :pieces, :product, foreign_key: true
  end
end
