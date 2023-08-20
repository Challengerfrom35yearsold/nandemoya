class Shop::CustomerInquiriesController < ApplicationController
  def index
    @customer_inquiries = CustomerInquiry.includes(:customer, :item, :customer_inquiry_threads).where(shop_id: current_shop.id, inquiry_status: "resolution").page(params[:page])
  end

  def show
    @customer_inquiry = CustomerInquiry.find(params[:id])
    @customer_inquiry_thread = CustomerInquiryThread.new
  end
end
