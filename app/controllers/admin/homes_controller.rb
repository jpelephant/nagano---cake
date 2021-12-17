class Admin::HomesController < ApplicationController
  def top
    @date1 = Date.current.strftime(‘%Y/%m/%d’)
    @date2 = Date.current.strftime(‘%Y年 %m月 %d日’)
    @orders = Order.all
    @order = Order.all.page(params[:page]).per(10)
  end
end
