class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @shipping_address = ShippingAddress.new
    @customer = current_customer
  end

  def verification
    @order = Order.new
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.total_payment = @total + @order.postage
    @order.payment_method = params[:order][:payment_method].to_i
    if params[:order][:address] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_address_name = current_customer.full_name
    elsif params[:order][:address] == "1"
      shipping_address = Address.find(params[:order][:shipping_address_id])
      @order.shipping_postal_code = shipping_address.postal_code
      @order.shipping_address = shipping_address.address
      @order.shipping_address_name = shipping_address.name
    elsif params[:order][:address] == "2"
      @order.shipping_postal_code = new.postal_code
      @order.shipping_address = new.address
      @order.shipping_address_name = new.name
    end
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
    params.require(:order).permit(:payment_method, :customer_id, :shipping_postal_code, :shipping_address, :shipping_address_name, :postage, :postal_code, :address, :name)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
  end
end
