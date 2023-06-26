class RenameTransactionInTransactionProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :transaction_products, :transaction_id, :purchased_transaction_id

  end
end
