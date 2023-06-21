class AddAttributesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :quantity, :integer
    add_column :products, :brand, :string
    add_column :products, :description_2, :text
  end
end
