class Admin::ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_genre).page(params[:page])
  end

  def items_per_shop
    @items = Item.includes(:item_genre).where(shop_id: params[:id]).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @item_genre = @item.item_genre
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :item_genre_id, :shop_genre_id, :price, :is_active, images: [] )
  end
end
