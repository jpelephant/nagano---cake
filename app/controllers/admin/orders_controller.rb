class Admin::OrdersController < ApplicationController

  def index
    @order_details = Order_detail.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.total_payment = @total + @order.postage
  end

  def update
  end

  def update
  end


  private
  def order_details_params
    params.require(:order_details).permit(:item_id, :order_id, :price, :amount)
  end

end
