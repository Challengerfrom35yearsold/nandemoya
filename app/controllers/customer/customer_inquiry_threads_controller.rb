class Customer::CustomerInquiryThreadsController < ApplicationController

  def create
    @customer_inquiry_thread = CustomerInquiryThread.new(customer_inquiry_thread_params)
    @customer_inquiry_thread.speaker_type = "customer"
    if @customer_inquiry_thread.save
      redirect_to customer_inquiry_confirmation_path
    else
      @customer_inquiry = @customer_inquiry_thread.customer_inquiry
      render template: "customer/customer_inquiries/show"
    end
  end

  private

  def customer_inquiry_thread_params
    params.require(:customer_inquiry_thread).permit(:customer_inquiry_id, :speaker_type, :message)
  end

end
