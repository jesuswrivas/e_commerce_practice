class AddTimestampsToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :created_at, :datetime, null: false
    add_column :purchases, :updated_at, :datetime, null: false
  end
end
