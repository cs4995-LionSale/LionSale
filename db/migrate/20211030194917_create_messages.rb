class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :sender_id, null: false, foreign_key: true
      t.references :to_id, null: false, foreign_key: true
      t.references :item_id, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
