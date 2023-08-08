class Admin::FavoriteShopsController < ApplicationController
  def index
    @customer_id = params[:customer_id]
    @favorite_shops = FavoriteShop.where(customer_id: @customer_id)
  end
end
