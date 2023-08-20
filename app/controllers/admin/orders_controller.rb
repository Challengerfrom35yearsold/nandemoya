class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:customer, :order_details).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item, :shop)
    @total_price = 0
    @order_details.each do |order_detail|
      price = (order_detail.price*1.1).floor
      amount = order_detail.amount
      @total_price = @total_price + price * amount
    end
    @order_details = @order.order_details.includes(:item, :shop).page(params[:page])
  end
end
