class AddAddressReferenceToActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :address, foreign_key: true
  end
end
