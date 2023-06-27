class AddColumnToPurchaseProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_products, :item_qty, :integer
    add_column :purchase_products, :item_price, :decimal
    
  end
end
