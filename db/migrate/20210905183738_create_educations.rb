class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :institution
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
