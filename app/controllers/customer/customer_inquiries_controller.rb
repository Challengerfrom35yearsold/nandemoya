class Customer::CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new
    @shop_id = params[:shop_id]
    @item_id = params[:item_id]
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)
    @customer_inquiry.customer_id = current_customer.id
    @customer_inquiry.save
    redirect_to customer_inquiry_confirmation_path
  end

  def index
    @customer_inquiries = CustomerInquiry.where(customer_id: current_customer.id).includes(:shop, :item, :customer_inquiry_threads)
  end

  def inquiry_confirmation
    @customer_inquiries = CustomerInquiry.where(customer_id: current_customer.id).includes(:shop, :item, :customer_inquiry_threads)
    @customer_inquiry_thread = CustomerInquiryThread.new
  end

  def update
    @customer_inquiry = CustomerInquiry.find(params[:id])
    @customer_inquiry.update(inquiry_status: "resolution")
    redirect_to customer_inquiries_path
  end

  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:customer_id, :shop_id, :item_id, :title, :inquiry)
  end

end
