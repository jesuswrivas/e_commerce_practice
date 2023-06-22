class UpdateColumnUser < ActiveRecord::Migration[7.0]
  def change

    change_column_null :users, :cart_id, true

  end
end
