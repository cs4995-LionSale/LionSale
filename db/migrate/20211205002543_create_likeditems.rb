class CreateLikeditems < ActiveRecord::Migration[6.1]
  def change
    create_table :likeditems do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :item, null: false, foreign_key: { to_table: :items }

      t.timestamps
    end

    add_index :likeditems, [:user_id, :item_id], unique: true
  end
end
