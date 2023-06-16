class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.date :date_of_birth
      t.string :country
      t.string :string
      t.string :address_1
      t.string :address_2

      t.timestamps
    end
  end
end
