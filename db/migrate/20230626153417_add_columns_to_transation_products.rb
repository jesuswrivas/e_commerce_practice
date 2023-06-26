class AddColumnsToTransationProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_products, :product, null: false, foreign_key: true
    add_reference :transaction_products, :transaction, null: false, foreign_key: true

  end
end
