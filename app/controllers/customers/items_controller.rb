class Customers::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
    @item = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
