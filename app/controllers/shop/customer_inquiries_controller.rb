class Shop::CustomerInquiriesController < ApplicationController
  def index
    @customer_inquiries = CustomerInquiry.where(shop_id: current_shop.id).includes(:customer_inquiry_threads)
  end
end
