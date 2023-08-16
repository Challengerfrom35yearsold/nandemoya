class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shops_path(@shop.id)
  end

  def shop_page
    @shop = Shop.find(params[:shop_id])
  end

  def shop_page_edit
    @shop = Shop.find(params[:shop_id])
  end

  def shop_page_update
    @shop = Shop.find(params[:shop_id])
    @shop.update(shop_page_params)
    redirect_to admin_shop_shop_page_path(@shop.id)
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_name_kana, :shop_genre_id, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

  def shop_page_params
    params.require(:shop).permit(:free_space, :shipping_carrier, :about_shipping, :personal_information, :settlement, :inquiry, :rogo_arrangement_btn, :introduction_arrangement_btn, :rogo_arrangement_btn, :introduction_arrangement_btn, :image, images: [] )
  end
end
