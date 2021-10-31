class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :from, null: false, foreign_key: { to_table: :users }
      t.references :to, null: false, foreign_key: { to_table: :users }
      t.references :item, null: false, foreign_key: { to_table: :users }
      t.text :content

      t.timestamps
    end
  end
end
