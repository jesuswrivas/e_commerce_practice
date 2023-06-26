class RenamePurchasedTransactionIdInPurchaseProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :purchase_products, :purchased_transaction_id, :purchase_id

  end
end
