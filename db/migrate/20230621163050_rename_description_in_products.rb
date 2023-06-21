class RenameDescriptionInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :description, :description_1
  end
end
