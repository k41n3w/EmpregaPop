class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.integer :kind
      t.integer :position
      t.integer :side
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
