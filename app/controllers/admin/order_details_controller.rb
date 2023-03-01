class Admin::OrderDetailsController < ApplicationController
  def update
    @order = OrderDetail.find(params[:id])
    @order.update(order_params)
    redirect_to admin_root_path
  end

  private

  def order_params
    params.require(:order_detail).permit(:crafting_status)
  end
end
