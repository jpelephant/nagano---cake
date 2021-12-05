class Customers::CartItemsController < ApplicationController
  def update
    @cart_items = Cart_item.all
  end

  def update
    cart_item = Cart_item.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_item_path(cart_item)
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end

  def destroy_all
    @cart_item = Cart_item.destroy
    @cart_item = Cart_item.destroy
    redirect_to cart_item_path
  end

  def create
  end
end
