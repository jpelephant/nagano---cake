class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    cart_item = Cart_item.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_item_path(cart_item)
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = Cart_item.destroy
    @cart_item = Cart_item.destroy
    redirect_to cart_item_path
  end

  def create
  end

    private
  def cart_item_params
  end
end
