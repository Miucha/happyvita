class ChangeCheckColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :check, :done
  end
end
