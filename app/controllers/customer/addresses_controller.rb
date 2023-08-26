class Customer::AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def index
    @addresses = current_customer.addresses.page(params[:page])
  end

  def edit
    @address = Address.find(params[:id])
    unless @address.customer.id == current_customer.id
      redirect_to addresses_path
    end
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
