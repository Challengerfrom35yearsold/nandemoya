class Customer::ItemsController < ApplicationController
  def index
    if params[:item_name]
      @items = Item.item_name_looks(params[:item_name]).page(params[:page]).per(8)
    elsif params[:item_genre_id]
      @items = Item.item_genre_name_looks(params[:item_genre_id]).page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
    #@genres = Genre.all
    #@cart_item = CartItem.new
  end
end
