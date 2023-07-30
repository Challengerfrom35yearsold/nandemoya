class Shop::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:items).where(items: {shop_id: current_shop.id}).page(params[:page])
  end

  def show
    @order = Order.where(id: params[:id]).includes(:items).first
    @order_details = @order.order_details
  end
end
