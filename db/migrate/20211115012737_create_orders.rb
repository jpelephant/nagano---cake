class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :shipping_postal_code, null: false
      t.integer :shipping_address, null: false
      t.integer :shipping_address_name, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false

      t.timestamps
    end
  end
end
