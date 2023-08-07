class Customer::WhatYouWantsController < ApplicationController
  def index
    @what_you_wants = WhatYouWant.where(customer_id: current_customer.id)
    @cart_item = CartItem.new
  end

  def create
    @what_you_want = WhatYouWant.new(what_you_want_params)
    @what_you_wants = current_customer.what_you_wants
    @what_you_wants_existing = @what_you_wants.find_by(item_id: params[:what_you_want][:item_id])
    unless @what_you_wants_existing
      @what_you_want.customer_id = current_customer.id
      @what_you_want.save
    end
    redirect_to what_you_wants_path
  end

  def destroy
    @what_you_want = WhatYouWant.find(params[:id])
    @what_you_want.destroy
    redirect_to what_you_wants_path
  end

  private

  def what_you_want_params
    params.require(:what_you_want).permit(:customer_id, :item_id)
  end
end
