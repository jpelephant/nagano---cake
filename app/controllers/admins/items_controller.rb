class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.all.page(params[:page]).per(10)
  end
  
  def new
    @item =Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end 
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :image_id, :genre_id, :introduction, :price)
  end
end

