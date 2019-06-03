class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :suite
      t.string :district
      t.string :city
      t.string :state
      t.integer :zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
