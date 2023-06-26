class CreateTransactionProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_products do |t|

      t.timestamps
    end
  end
end
