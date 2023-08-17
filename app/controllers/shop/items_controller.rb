class Shop::ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_genre).where(shop_id: current_shop.id).page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.shop_id = current_shop.id
    if @item.save
      redirect_to shop_item_path(@item.id)
    else
      render :new
    end
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
    if @item.update(item_params)
      redirect_to shop_item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :item_genre_id, :shop_genre_id, :price, :is_active, images: [] )
  end

end
