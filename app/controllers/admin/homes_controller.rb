class Admin::HomesController < Admin::BaseController
  def top
    @shop_inquiries = ShopInquiry.includes(:shop, :shop_inquiry_threads).where(inquiry_status: "unsolved").page(params[:page])
  end
end
