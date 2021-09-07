class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :website
      t.string :address_country
      t.string :address_city
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
