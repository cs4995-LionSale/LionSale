class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :from, null: false, { to_table: :users }
      t.references :to, null: false, { to_table: :users }
      t.references :item, null: false, { to_table: :users }
      t.text :content

      t.timestamps
    end
  end
end
