class Admin::ShopGenresController < Admin::BaseController
  def index
    @shop_genre = ShopGenre.new
    @shop_genres = ShopGenre.page(params[:page])
  end

  def create
    @shop_genre = ShopGenre.new(shop_genre_params)
    if @shop_genre.save
      redirect_to admin_shop_genres_path
    else
      @shop_genres = ShopGenre.page(params[:page])
      render :index
    end
  end

  def edit
    @shop_genre = ShopGenre.find(params[:id])
  end

  def update
    @shop_genre = ShopGenre.find(params[:id])
    @shop_genre.update(shop_genre_params)
    redirect_to admin_shop_genres_path
  end

  private

  def shop_genre_params
    params.require(:shop_genre).permit(:name)
  end
end
