class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :item, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.datetime :expected_deal_time
      t.datetime :real_deal_time
      t.string :deal_address
      t.decimal :deal_price
      t.integer :status
      t.integer :seller_rating
      t.integer :buyer_rating

      t.timestamps
    end
  end
end
