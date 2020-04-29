class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :amount, null: false
      t.integer :buy_price, null: false
      t.integer :make_status, default: 0

      t.timestamps
    end
  end
end
