class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.string :ship_name, null:false
      t.string :ship_address, null: false
      t.integer :ship_postal_code, null: false
      t.integer :order_status, default: 0
      t.integer :postage, null: false
      t.integer :payment, null: false
      t.integer :payment_method, null: false
      t.integer :select_address
      t.string :address_info

      t.timestamps
    end
  end
end
