class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item =Item.new
    @categories = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item)
    else
    render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Genre.all
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :is_active)
  end
end

