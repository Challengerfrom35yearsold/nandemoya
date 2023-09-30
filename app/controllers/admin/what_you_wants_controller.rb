class Admin::WhatYouWantsController < Admin::BaseController
  def index
    @customer_id = params[:customer_id]
    @what_you_wants = WhatYouWant.includes(:item, :shop).where(customer_id: @customer_id).page(params[:page])
  end
end
