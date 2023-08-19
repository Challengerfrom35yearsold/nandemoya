class Shop::CustomerInquiryThreadsController < ApplicationController
  def create
    @customer_inquiry_thread = CustomerInquiryThread.new(customer_inquiry_thread_params)
    @customer_inquiry_thread.speaker_type = "shop"
    if @customer_inquiry_thread.save
      redirect_to shop_path
    else
      @customer_inquiry = @customer_inquiry_thread.customer_inquiry
      render template: "shop/customer_inquiries/show"
    end
  end

  private

  def customer_inquiry_thread_params
    params.require(:customer_inquiry_thread).permit(:customer_inquiry_id, :speaker_type, :message)
  end
end
