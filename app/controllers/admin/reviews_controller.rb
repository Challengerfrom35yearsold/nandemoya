class Admin::ReviewsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_reviews = Review.where(item_id: params[:item_id]).page(params[:page])
  end

  def edit
    @review = Review.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to admin_item_reviews_path(params[:item_id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_item_reviews_path(params[:item_id])
  end

  def review_params
    params.require(:review).permit(:customer_id, :item_id, :title, :review_content, :number_of_stars )
  end
end
