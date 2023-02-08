class Admin::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:genre_id,:name,:introduction,:price)
  end

end
