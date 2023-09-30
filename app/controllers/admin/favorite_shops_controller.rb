class Admin::FavoriteShopsController < Admin::BaseController
  def index
    @customer_id = params[:customer_id]
    @favorite_shops = FavoriteShop.includes(:shop).where(customer_id: @customer_id).page(params[:page])
  end
end