class Admin::ItemGenresController < Admin::BaseController
  def index
    @item_genre = ItemGenre.new
    @item_genres = ItemGenre.page(params[:page])
  end

  def create
    @item_genre = ItemGenre.new(item_genre_params)
    if @item_genre.save
      redirect_to admin_item_genres_path
    else
      @item_genres = ItemGenre.page(params[:page])
      render :index
    end
  end

  def edit
    @item_genre = ItemGenre.find(params[:id])
  end

  def update
    @item_genre = ItemGenre.find(params[:id])
    @item_genre.update(item_genre_params)
    redirect_to admin_item_genres_path
  end

  private

  def item_genre_params
    params.require(:item_genre).permit(:name)
  end
end
