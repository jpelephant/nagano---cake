class Admin::HomesController < ApplicationController
  def top
    @order_details = OrderDetail.all.page(params[:page]).per(10)
    
  end
end
