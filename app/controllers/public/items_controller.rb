class Public::ItemsController < ApplicationController
  def index
    @item = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @cart_item.item_id = @item.id
    @cart_item.customer_id = current_customer.id
  end
end
