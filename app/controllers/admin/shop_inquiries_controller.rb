class Admin::ShopInquiriesController < ApplicationController
  def index
    @shop_inquiries = ShopInquiry.includes(:shop, :shop_inquiry_threads).where(inquiry_status: "resolution").page(params[:page])
  end

  def show
    @shop_inquiry = ShopInquiry.find(params[:id])
    @shop_inquiry_thread = ShopInquiryThread.new
  end
end
