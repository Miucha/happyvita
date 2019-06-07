class AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    # testar se está save e fechar a janela e carregar os novos endereços
    @address.save
    # respond_to create.js # <-- will render `app/views/reviews/create.js.erb`

  end

  private

  def address_params
    params.require(:address).permit(:street, :number, :suite, :district, :city, :state, :zipcode)
  end
end
