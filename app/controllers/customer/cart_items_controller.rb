class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.includes(:item).page(params[:page]).per(10)
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.customer.id == current_customer.id
      @cart_item.update(cart_item_params)
    end
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.customer.id == current_customer.id
      @cart_item.destroy
    end
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)

    @cart_items = current_customer.cart_items
    @cart_item_existing = @cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item_existing
      new_amount = @cart_item_existing.amount+@cart_item.amount
      @cart_item_existing.update(amount: new_amount)
      @cart_item.delete
    else
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end

