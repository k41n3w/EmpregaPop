class CreateSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :socials do |t|
      t.integer :kind
      t.string :url
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
