class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:customer, :order_details).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item, :shop)
  end
end
