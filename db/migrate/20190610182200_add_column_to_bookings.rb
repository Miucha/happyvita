class AddColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :review_photo, :string
    add_column :bookings, :review_rate, :integer
    add_column :bookings, :review_comment, :text
  end
end
