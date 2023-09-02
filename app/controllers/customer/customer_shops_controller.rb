class Customer::CustomerShopsController < ApplicationController
  def index
    @shops = Shop.shop_genre_name_looks(params[:shop_genre_id]).page(params[:page]).per(8)
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
