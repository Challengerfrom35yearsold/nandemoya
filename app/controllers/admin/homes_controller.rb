class Admin::HomesController < ApplicationController
  def top
    @shop_inquiries = ShopInquiry.includes(:shop, :shop_inquiry_threads).where(inquiry_status: "unsolved").page(params[:page])
  end
end
