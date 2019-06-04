class RemoveZipcodeFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :zipcode
  end
end
