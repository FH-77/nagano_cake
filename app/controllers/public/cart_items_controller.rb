class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    @cart_items = current_customer.cart_items.all
    if @cart_items.find_by(item_id: @cart_item.item_id).present?
       new_amount = @cart_items.find_by(item_id: @cart_item.item_id).amount + @cart_item.amount
       @cart_items.find_by(item_id: @cart_item.item_id).update_attribute(:amount, new_amount)
    else
      @cart_item.save
    end
    redirect_to cart_items_path,notice: "カートに商品が入りました"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました'
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
