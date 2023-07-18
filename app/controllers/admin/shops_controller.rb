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
  end

  def shop_page_edit
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_name_kana, :genre_id, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
