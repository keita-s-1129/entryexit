class AddressesController < ApplicationController

  def new
    @addresses = Address.all
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

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      redirect_to address_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:address)
  end
end
