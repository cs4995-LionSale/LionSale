class CreateCheckins < ActiveRecord::Migration[6.1]
  def change
    create_table :checkins do |t|
      t.references :transaction, null: false, foreign_key: { to_table: :transactions }
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
