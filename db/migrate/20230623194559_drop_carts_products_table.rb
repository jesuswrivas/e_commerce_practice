class DropCartsProductsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :carts_products
  end
end
