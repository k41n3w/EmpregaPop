class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :slug

      t.boolean :active, default: false
      t.boolean :listed, default: false
      t.boolean :featured, default: false

      t.integer :temp_avatar
      t.boolean :remote_ok
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
