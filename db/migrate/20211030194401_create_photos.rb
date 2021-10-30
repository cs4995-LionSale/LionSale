class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :photo_url
      t.references :item, null: false, foreign_key: { to_table: :items }

      t.timestamps
    end
  end
end
