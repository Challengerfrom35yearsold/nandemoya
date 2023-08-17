class Customer::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.item_id = @item.id
    @review.save
    redirect_to item_item_reviews_path(@item.id)
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to item_item_reviews_path(params[:item_id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_item_reviews_path(params[:item_id])
  end

  def edit
    @review = Review.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def index
    @reviews = Review.includes(:item).where(customer_id: current_customer.id).page(params[:page])
  end

  def item_reviews
    @item = Item.find(params[:item_id])
    @item_reviews = Review.where(item_id: params[:item_id]).page(params[:page])
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :item_id, :title, :review_content, :number_of_stars )
  end
end
