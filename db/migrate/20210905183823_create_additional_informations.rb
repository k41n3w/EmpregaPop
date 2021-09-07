class CreateAdditionalInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_informations do |t|
      t.string :title
      t.text :description
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
