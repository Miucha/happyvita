class AddConfirmedToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :confirmed, :boolean, :default => true
  end
end
