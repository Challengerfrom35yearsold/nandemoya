class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to shop_my_page_path
  end

  def withdraw
    @orders = Order.includes(:items, :order_details).where(items: {shop_id: current_shop.id})
    total_orders_shipping_status_sent = 0
    @orders.each do |order|
      total_current_shop = 0
      order.order_details.each do |order_detail|
        if order_detail.item.shop_id == current_shop.id
          total_current_shop = total_current_shop + 1
        end
      end
      total_shipping_status_sent = 0
      order.order_details.each do |order_detail|
        if order_detail.item.shop_id == current_shop.id
          if order_detail.shipping_status == "sent"
            total_shipping_status_sent = total_shipping_status_sent + 1
          end
        end
      end
      if total_current_shop == total_shipping_status_sent
        total_orders_shipping_status_sent = total_orders_shipping_status_sent + 1
      end
    end

    if @orders.count == total_orders_shipping_status_sent
      @shop = current_shop
      @shop.update(is_deleted: true)
      reset_session
      redirect_to new_shop_session_path
    else
      flash[:notice] = "未配送の商品があります。<br>配送を完了させてください。"
      redirect_to shop_my_page_path
    end
  end

  def inquiry
  end

  def shop_page_update
    @shop = current_shop
    if @shop.update(shop_page_params)
      redirect_to shop_shop_page_path
    else
      render :shop_page_edit
    end
  end

  def shop_page
    @shop = current_shop
  end

  def shop_page_edit
    @shop = current_shop
  end

  def unsubscribe
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_name_kana, :shop_genre_id, :postal_code, :address, :telephone_number, :email)
  end

  def shop_page_params
    params.require(:shop).permit(:free_space, :shipping_carrier, :about_shipping, :personal_information, :settlement, :inquiry, :rogo_arrangement_btn, :introduction_arrangement_btn, :image, images: [] )
  end
end
