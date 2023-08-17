class Admin::ShopInquiriesController < ApplicationController
  def index
    @shop_inquiries = ShopInquiry.includes(:shop, :shop_inquiry_threads)
  end
end
