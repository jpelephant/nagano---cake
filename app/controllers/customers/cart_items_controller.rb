class Customers::CartItemsController < ApplicationController
  def update
    @cart_items = Cart_item.all
  end
  
  def update
  end
  
  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end
  
  def destroy_all
    @cart_item = Cart_item.destroy
    redirect_to cart_item_path
  end
  
  def create
  end
end
