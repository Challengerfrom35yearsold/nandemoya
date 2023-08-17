class Shop::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if  @order_detail.item.shop.id == current_shop.id
      @order_detail.update(order_detail_params)
      redirect_to shop_order_path(@order_detail.order_id)
    else
      render template: "orders/show"
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:shipping_status)
  end
end
