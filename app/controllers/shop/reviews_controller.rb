class Shop::ReviewsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_reviews = Review.where(item_id: params[:item_id]).page(params[:page])
  end
end
