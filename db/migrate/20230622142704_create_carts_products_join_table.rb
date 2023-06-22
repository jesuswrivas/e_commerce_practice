class CreateCartsProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :carts_products, id: false do |t|
      t.references :cart
      t.references :product   
    end

    add_index :carts_products, [:cart_id, :product_id], unique: true

  end
end
