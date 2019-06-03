class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.boolean :check
      t.date :schedule_date
      t.references :activity, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
