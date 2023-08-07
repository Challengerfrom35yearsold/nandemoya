class Shop::CustomerInquiryThreadsController < ApplicationController
  def create
    @customer_inquiry_thread = CustomerInquiryThread.new(customer_inquiry_thread_params)
    @customer_inquiry_thread.speaker_type = "shop"
    @customer_inquiry_thread.save
    redirect_to shop_path
  end

  private

  def customer_inquiry_thread_params
    params.require(:customer_inquiry_thread).permit(:customer_inquiry_id, :speaker_type, :message)
  end
end
