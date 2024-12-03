class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = '正しく登録されました！' 
      redirect_to new_address_path
    else 
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:address)
  end
end
