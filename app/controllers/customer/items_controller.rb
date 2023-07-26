class Customer::ItemsController < ApplicationController
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
    else params[:price_order] == "asc"
      @items = @items.order(price: "ASC")
    end
    @items = @items.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
