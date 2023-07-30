class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.where(id: params[:id]).includes(:items).first
    @order_details = @order.order_details
  end
end
