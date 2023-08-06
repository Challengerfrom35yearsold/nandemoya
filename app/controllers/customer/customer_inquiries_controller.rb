class Customer::CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)
    @customer_inquiry.customer_id = current_customer.id
    @customer_inquirym.save
    redirect_to customer_inquiry_path(@customer_inquirym.id)
  end

  def index
  end

  def show
  end


  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:customer_id, :shop_id, :title, :inquiry, :inquiry_status)
  end


end
