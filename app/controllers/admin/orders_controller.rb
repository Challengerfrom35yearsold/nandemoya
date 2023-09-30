class Admin::OrdersController < Admin::BaseController
  def index
    @customer_id = params[:customer_id]
    @orders = Order.includes(:customer, :order_details).where(customer_id: @customer_id).page(params[:page])
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
