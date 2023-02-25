class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!

    current_customer.cart_items.each do |cart_items|
      @ordered_item = OrderedItem.new
      @ordered_item.item_id = cart_items.item_id
      @ordered_item.amount = cart_items.amount
      @ordered_item.with_tax_price = (cart_items.item.price*1.1).floor
      @ordered_item.order_id = @order.id
      @ordered_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:selected_address] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:selected_address] == "1"
        ship = Address.find(params[:order][:customer_id])
      @order.shipping_postal_code = ship.postal_code
      @order.shipping_address = ship.address
      @order.shipping_name = ship.name
    elsif  params[:order][:selected_address] == "2"
      @order.shipping_postal_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    else
            render 'new'
    end

      @cart_items = current_customer.cart_items.all
      @order.customer_id = current_customer.id
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(6).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address,:shipping_postal_code,:shipping_name,:payment_method,:postage,:payment,:order_status,:customer_id)
  end
end
