class Customers::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @items = Item.all.page(params[:page]).per(5)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
