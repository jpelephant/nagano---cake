class Customers::OrdersController < ApplicationController
  def new
    @shipping_address = ShippingAddress.new
  end

  def verification
    @order = current_customer.orders.new
    @cart_items = current_customer.cart_items
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

     binding.pry
  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end
end
