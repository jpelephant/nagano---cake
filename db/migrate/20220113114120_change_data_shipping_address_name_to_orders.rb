class ChangeDataShippingAddressNameToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :shipping_address_name, :string
  end
end
