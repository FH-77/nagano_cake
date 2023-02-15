class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @alladdress = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id,:postal_code,:address,:name)
  end
end
