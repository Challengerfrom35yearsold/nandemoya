class Shop::HomesController < ApplicationController
  def top
    @customer_inquiries = CustomerInquiry.includes(:customer, :item, :customer_inquiry_threads).where(shop_id: current_shop.id, inquiry_status: "unsolved").page(params[:page])
  end

end
