class Admin::ShopInquiriesController < ApplicationController
  def index
    @shop_inquiries = ShopInquiry.includes(:shop, :shop_inquiry_threads)
  end

  def show
    @shop_inquiry = ShopInquiry.find(params[:id])
    @shop_inquiry_thread = ShopInquiryThread.new
  end
end
