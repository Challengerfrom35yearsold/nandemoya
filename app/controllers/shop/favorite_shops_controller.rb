class Shop::FavoriteShopsController < ApplicationController
  def index
    @favorite_shops = FavoriteShop.includes(:customer).where(shop_id: current_shop.id, is_deleted: true)
  end
end
