class Customers::OrdersController < ApplicationController
  def new
    @addresses = Address.new
  end
  
  def verification
    @cart_items = Cart_item.all
    @cart_items= current_customer.cart_items.all
    @addresses = Address.find(params[:order][:select_address])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
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
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
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
