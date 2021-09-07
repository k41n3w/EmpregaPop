class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.text :description
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
