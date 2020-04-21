class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.boolean :sale_status, null: false, default: true
      t.integer :price, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
