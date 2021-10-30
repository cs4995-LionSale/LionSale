class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :avatar_url
      t.string :address
      t.float :rating_seller
      t.float :rating_buyer
      t.integer :permission

      t.timestamps
    end
  end
end
