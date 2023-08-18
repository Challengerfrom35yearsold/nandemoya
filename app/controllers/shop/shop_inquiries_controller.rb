class Shop::ShopInquiriesController < ApplicationController
  def new
    @shop_inquiry = ShopInquiry.new
  end

  def create
    @shop_inquiry = ShopInquiry.new(shop_inquiry_params)
    @shop_inquiry.shop_id = current_shop.id
    @shop_inquiry.save
    redirect_to shop_shop_inquiry_confirmation_path
  end

  def index
    @shop_inquiries = ShopInquiry.where(shop_id: current_shop.id).includes(:shop_inquiry_threads)
  end

  def inquiry_confirmation
    @shop_inquiries = ShopInquiry.where(shop_id: current_shop.id).includes(:shop_inquiry_threads)
    @shop_inquiry_thread = ShopInquiryThread.new
  end

  def update
    @shop_inquiry = ShopInquiry.find(params[:id])
    if  @shop_inquiry.shop.id == current_shop.id
      @shop_inquiry.update(inquiry_status: "resolution")
      redirect_to shop_shop_inquiries_path
    else
      redirect_to shop_shop_inquiry_confirmation_path
    end

  end

  private

  def shop_inquiry_params
    params.require(:shop_inquiry).permit(:shop_id, :title, :inquiry)
  end
end
