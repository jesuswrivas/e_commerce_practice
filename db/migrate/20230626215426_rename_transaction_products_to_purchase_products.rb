class RenameTransactionProductsToPurchaseProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :transaction_products, :purchase_products
  end
end
