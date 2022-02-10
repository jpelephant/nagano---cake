class Customers::OrdersController < ApplicationController
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
    #@order.payment_method = params[:order][:payment_method].to_i
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
    @cart_item = CartItem.new(params[:id])
    @order.customer_id = current_customer_id
    @order = @cart_item.order.new(order_params)
    if @order.save
      @order_details =OrderDesails.new(order_details_params)
      @order_details.item_id = @cart_item.item.name
      @order_details.order_id = 
      @order_details.price  = @cart_item.item.price
      @order_details.amount = @cart_item.amount
    end
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @order = current_customer.orders

  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.postage = 800
    @order.total_payment = @total + @order.postage
  end

  private
  def order_params
    params.permit(:payment_method, :customer_id, :shipping_postal_code, :shipping_address, :shipping_address_name, :postage, :total_payment, :created_at)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
