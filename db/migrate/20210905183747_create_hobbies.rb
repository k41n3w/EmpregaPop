class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.string :title
      t.decimal :percent, precision: 5, scale: 2
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
