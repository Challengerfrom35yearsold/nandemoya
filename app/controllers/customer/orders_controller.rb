class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def comfirm

    if params[:order]
      Rails.cache.fetch('order') do
        params[:order]
      end
      Rails.cache.fetch('order_address_btn') do
        params[:order][:address_btn]
      end
    else
      if Rails.cache.fetch('order')
        params[:order] = Rails.cache.fetch('order')
        params[:order][:address_btn] = Rails.cache.fetch('order_address_btn')
      else
        redirect_to new_order_path
        return
      end
    end

    @order = Order.new(order_params)

    if params[:order][:address_btn] == "myself_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    end

    if params[:order][:address_btn] == "registered_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

    @cart_items = current_customer.cart_items
    @total = 0

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all

    @what_you_wants = WhatYouWant.where(customer_id: current_customer.id)
    @order_details = OrderDetail.where(order_id: @order.id)
    @what_you_wants.each do |what_you_want|
      @what_you_want_item_id = what_you_want.item_id
      @order_details.each do |order_detail|
        if @what_you_want_item_id == order_detail.item_id
          what_you_want.destroy
        end
      end
    end
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders.includes(:order_details, :items)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :address_btn, :address_id, :payment_method, :total_payment)
  end


end