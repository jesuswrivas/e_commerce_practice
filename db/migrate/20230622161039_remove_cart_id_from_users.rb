class RemoveCartIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :cart_id
  end
end
