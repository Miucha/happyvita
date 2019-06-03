class ChangeCheckToFalseOnBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :check, false
  end
end
