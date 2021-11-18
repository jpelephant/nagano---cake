class Admins::HomesController < ApplicationController
  def top
    @date1 = Date.current.strftime(‘%Y/%m/%d’)
    @date2 = Date.current.strftime(‘%Y年 %m月 %d日’)
    
    @order = Order.all.page(params[:page]).per(10)
  end
end
