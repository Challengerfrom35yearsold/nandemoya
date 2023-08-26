class Customer::CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new
    @shop_id = params[:shop_id]
    @item_id = params[:item_id]
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)
    @customer_inquiry.customer_id = current_customer.id
    if @customer_inquiry.save
      redirect_to customer_inquiry_confirmation_path
    else
      @shop_id = @customer_inquiry.shop.id
      @item_id = @customer_inquiry.item.id
      render :new
    end
  end

  def index
    @customer_inquiries = CustomerInquiry.includes(:shop, :item, :customer_inquiry_threads).where(customer_id: current_customer.id, inquiry_status: "resolution").page(params[:page])
  end

  def inquiry_confirmation
    @customer_inquiries = CustomerInquiry.includes(:shop, :item, :customer_inquiry_threads).where(customer_id: current_customer.id, inquiry_status: "unsolved").page(params[:page])
  end

  def show
    @customer_inquiry = CustomerInquiry.find(params[:id])
    @customer_inquiry_thread = CustomerInquiryThread.new
    unless @customer_inquiry.customer.id == current_customer.id
      redirect_to customer_inquiries_path
    end
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
