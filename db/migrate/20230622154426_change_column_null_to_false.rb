class ChangeColumnNullToFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :cart_id, false
  end
end
