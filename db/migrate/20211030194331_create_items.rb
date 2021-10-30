class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.references :seller_id, null: false, foreign_key: true
      t.decimal :price
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :status
      t.references :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
