class Shop::ShopInquiryThreadsController < ApplicationController
  def create
    @shop_inquiry_thread = ShopInquiryThread.new(shop_inquiry_thread_params)
    @shop_inquiry_thread.speaker_type = "shop"
    if @shop_inquiry_thread.save
      redirect_to shop_shop_inquiry_confirmation_path
    else
      @shop_inquiry = @shop_inquiry_thread.shop_inquiry
      render template: "shop/shop_inquiries/show"
    end
  end

  private

  def shop_inquiry_thread_params
    params.require(:shop_inquiry_thread).permit(:shop_inquiry_id, :speaker_type, :message)
  end
end
