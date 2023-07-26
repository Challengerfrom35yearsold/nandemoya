class Shop::OrdersController < ApplicationController
  def index
    #@orders = Order.where(shop_id: current_shop.id).page(params[:page])
    @order_details = OrderDetail.joins(:shop,:item).where(shop_id: current_shop.id)


  def show
    @order = Order.find(params[:id])
    @order_details = Order.order_details.joins(:shop,:item).where(shop[current_shop.id])
  end
end
