class ChangeDataShippingAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :shipping_address, :string
  end
end
