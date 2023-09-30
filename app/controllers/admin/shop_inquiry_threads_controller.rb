class Admin::ShopInquiryThreadsController < Admin::BaseController
  def create
    @shop_inquiry_thread = ShopInquiryThread.new(shop_inquiry_thread_params)
    @shop_inquiry_thread.speaker_type = "admin"
    if @shop_inquiry_thread.save
      redirect_to admin_path
    else
      @shop_inquiry = @shop_inquiry_thread.shop_inquiry
      render template: "admin/shop_inquiries/show"
    end
  end

  private

  def shop_inquiry_thread_params
    params.require(:shop_inquiry_thread).permit(:shop_inquiry_id, :speaker_type, :message)
  end
end
