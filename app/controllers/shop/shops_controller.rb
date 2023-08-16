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

  def shop_page_new
    @shop = current_shop
  end

  def shop_page_update
    @shop = current_shop
    @shop.update(shop_page_params)
    redirect_to shop_shop_page_path
  end

  def shop_page
    @shop = current_shop
  end

  def shop_page_edit
    @shop = current_shop
  end

  def unsubscribe
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_name_kana, :shop_genre_id, :postal_code, :address, :telephone_number, :email)
  end

  def shop_page_params
    params.require(:shop).permit(:free_space, :shipping_carrier, :about_shipping, :personal_information, :settlement, :inquiry, :rogo_arrangement_btn, :introduction_arrangement_btn, :rogo_arrangement_btn, :introduction_arrangement_btn, :image, images: [] )
  end
end
