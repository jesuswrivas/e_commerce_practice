class AddColumnToPurchasProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchase_products, :review, foreign_key: true
  end
end
