class Shop::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:customer, :items, :order_details).where(items: {shop_id: current_shop.id}).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item).where(items: {shop_id: current_shop.id})
    @order_details_first = @order_details.first
    @order_details_first_shop_id = @order_details_first.item.shop.id
    unless @order_details_first_shop_id == current_shop.id
      redirect_to shop_orders_path
    end
  end
end
