class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to shop_my_page_path
  end

  def withdraw
    @shop = current_shop
    @shop.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def inquiry
  end

  def shop_page
  end

  def shop_page_edit
  end

  def unsubscribe
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_name_kana, :shop_genre_id, :postal_code, :address, :telephone_number, :email)
  end
end
