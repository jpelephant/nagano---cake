class Admin::OrdersController < ApplicationController
  
  def index
    @customer = Customer.find(params[:id])
    @order_details = Order_detail.all.page(params[:page])
    @order_detail = Order_detail.all
  end
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }

    @order.postage = 800
    @order.total_payment = @total + @order.postage
  end
  
  def update
  end
  
  def update
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end
  
  
end
