class Shop::HomesController < ApplicationController
  def top
    @customer_inquiries = CustomerInquiry.where(shop_id: current_shop.id).includes(:customer_inquiry_threads)
    @customer_inquiry_thread = CustomerInquiryThread.new
  end

  def about
  end
end
