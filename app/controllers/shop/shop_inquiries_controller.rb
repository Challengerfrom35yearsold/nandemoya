class Shop::ShopInquiriesController < ApplicationController
  def new
    @shop_inquiry = ShopInquiry.new
  end

  def create
    @shop_inquiry = ShopInquiry.new(shop_inquiry_params)
    @shop_inquiry.shop_id = current_shop.id
    if @shop_inquiry.save
      redirect_to shop_shop_inquiry_confirmation_path
    else
      render :new
    end
  end

  def index
    @shop_inquiries = ShopInquiry.includes(:shop_inquiry_threads).where(shop_id: current_shop.id, inquiry_status: "resolution").page(params[:page])
  end

  def inquiry_confirmation
    @shop_inquiries = ShopInquiry.includes(:shop_inquiry_threads).where(shop_id: current_shop.id, inquiry_status: "unsolved").page(params[:page])
  end

  def show
    @shop_inquiry = ShopInquiry.find(params[:id])
    @shop_inquiry_thread = ShopInquiryThread.new
  end

  def update
    @shop_inquiry = ShopInquiry.find(params[:id])
    @shop_inquiry.update(inquiry_status: "resolution")
    redirect_to shop_shop_inquiries_path
  end

  private

  def shop_inquiry_params
    params.require(:shop_inquiry).permit(:shop_id, :title, :inquiry)
  end
end
