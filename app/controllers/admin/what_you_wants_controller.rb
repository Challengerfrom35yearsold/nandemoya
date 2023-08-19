class Admin::WhatYouWantsController < ApplicationController
  def index
    @customer_id = params[:customer_id]
    @what_you_wants = WhatYouWant.includes(:item, :shop).where(customer_id: @customer_id)
  end
end
