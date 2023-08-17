class Shop::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:customer, :items, :order_details).where(items: {shop_id: current_shop.id}).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item).where(items: {shop_id: current_shop.id})
  end
end
