class Admin::ShopInquiryThreadsController < ApplicationController
  def create
    @shop_inquiry_thread = ShopInquiryThread.new(shop_inquiry_thread_params)
    @shop_inquiry_thread.speaker_type = "admin"
    @shop_inquiry_thread.save
    redirect_to admin_path
  end

  private

  def shop_inquiry_thread_params
    params.require(:shop_inquiry_thread).permit(:shop_inquiry_id, :speaker_type, :message)
  end
end
