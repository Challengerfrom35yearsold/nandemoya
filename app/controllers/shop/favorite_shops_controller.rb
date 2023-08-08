class Shop::FavoriteShopsController < ApplicationController
  def index
    @favorite_shops = FavoriteShop.where(shop_id: current_shop.id, is_deleted: true)
  end
end
