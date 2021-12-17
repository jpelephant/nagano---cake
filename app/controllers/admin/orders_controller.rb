class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.cart_item
  end
  
  def update
  end
  
  def update
  end
end
