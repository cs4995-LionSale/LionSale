class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.decimal :price
      t.integer :status
      t.references :category, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :items, [:seller_id, :created_at]
  end
end
