class ChangeScheduleDateToDatetimeOnBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :schedule_date, :datetime
  end
end
