class Admin::HomesController < ApplicationController
  def top
    @shop_inquiries = ShopInquiry.includes(:shop_inquiry_threads)
    @shop_inquiry_thread = ShopInquiryThread.new
  end
end
