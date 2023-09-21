class Customer::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    if params[:item_name]
      @items = Item.item_name_looks(params[:item_name])
    elsif params[:item_genre_id]
      @items = Item.item_genre_name_looks(params[:item_genre_id])
    else
      @items = Item.all
    end

    if params[:price_order] == "desc"
      @items = @items.order(price: "DESC")
    elsif params[:price_order] == "asc"
      @items = @items.order(price: "ASC")
    end
    @items = @items.where(is_active: true).page(params[:page]).per(8)
  end

  def items_per_shop
    @items = Item.where(shop_id: params[:id])
    if params[:price_order] == "desc"
      @items = @items.order(price: "DESC")
    elsif params[:price_order] == "asc"
      @items = @items.order(price: "ASC")
    end
    @items = @items.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @what_you_want = WhatYouWant.new
    @favorite_shop = FavoriteShop.new
  end

end
