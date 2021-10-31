class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.references :seller, null: false, { to_table: :users }
      t.decimal :price
      t.integer :status
      t.references :category, null: false, { to_table: :categories }

      t.timestamps
    end
  end
end
