class Shop::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:customer, :items, :order_details).where(items: {shop_id: current_shop.id}).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item).where(items: {shop_id: current_shop.id})
    if @order_details.blank?
      redirect_to shop_orders_path
    end
    @total_price = 0
    @order_details.each do |order_detail|
      price = (order_detail.price*1.1).floor
      amount = order_detail.amount
      @total_price = @total_price + price * amount
    end
    @order_details = @order.order_details.includes(:item).where(items: {shop_id: current_shop.id}).page(params[:page])
  end
end
