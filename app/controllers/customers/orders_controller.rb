class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @shipping_address = ShippingAddress.new
    @customer = current_customer
  end

  def verification
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.total_payment = @total + @order.postage
    if params[:order][:select_address] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_address_name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.shipping_postal_code = shipping_address.postal_code
      @order.shipping_address = shipping_address.address
      @order.shipping_address_name = shipping_address.name
    elsif params[:order][:select_address] == "2"
      @order.shipping_postal_code = params[:order][:postal_code]
      @order.shipping_address = params[:order][:address]
      @order.shipping_address_name = params[:order][:name]
    end
  end

  def confirm
    @cart_item = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_item.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.item_id = cart_item.item.id
        @order_details.order_id = @order.id
        @order_details.price  = cart_item.item.price
        @order_details.amount = cart_item.amount
        @order_details.save
      end
      @cart_item.destroy_all

    end
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @order = current_customer.orders.all.page(params[:page]).per(5)
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.total_payment = @total + @order.postage
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :shipping_postal_code, :shipping_address, :shipping_address_name, :postage, :total_payment, :created_at)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def order_details_params
    params.require(:order_details).permit(:item_id, :order_id, :price, :amount)
  end
end
