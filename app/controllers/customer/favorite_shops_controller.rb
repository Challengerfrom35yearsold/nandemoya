class Customer::FavoriteShopsController < ApplicationController
  def index
    @favorite_shops = FavoriteShop.includes(:shop).where(customer_id: current_customer.id)
  end

  def create
    @favorite_shop = FavoriteShop.new(favorite_shop_params)
    @favorite_shop.customer_id = current_customer.id
    @favorite_shop.save
    redirect_to favorite_shops_path
  end

  def receive
    @favorite_shop = FavoriteShop.find(params[:id])
    @favorite_shop.update(is_deleted: true)
    redirect_to favorite_shops_path
  end

  def unlock
    @favorite_shop = FavoriteShop.find(params[:id])
    @favorite_shop.update(is_deleted: false)
    redirect_to favorite_shops_path
  end

  def destroy
    @favorite_shop = FavoriteShop.find(params[:id])
    @favorite_shop.destroy
    redirect_to favorite_shops_path
  end

  private

  def favorite_shop_params
    params.require(:favorite_shop).permit(:customer_id, :shop_id)
  end
end
