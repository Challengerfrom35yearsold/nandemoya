class Admin::ShopInquiriesController < ApplicationController
  def index
    @shop_inquiries = ShopInquiry.includes(:shop_inquiry_threads)
  end
end
