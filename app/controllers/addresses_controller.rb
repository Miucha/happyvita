class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      redirect_to new_event_path, notice: "Endereço criado com sucesso"
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :number, :suite, :district, :city, :state, :zipcode)
  end
end
