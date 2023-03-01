class Admin::OrdersController < ApplicationController

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params) && @order.order_status == "入金確認"
      @order_details.update_all(crafting_status: "製作待ち")
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
