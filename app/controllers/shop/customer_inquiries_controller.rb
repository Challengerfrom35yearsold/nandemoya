class Shop::CustomerInquiriesController < ApplicationController
  def index
    @customer_inquiries = CustomerInquiry.includes(:customer, :item, :customer_inquiry_threads).where(shop_id: current_shop.id)
  end
end
