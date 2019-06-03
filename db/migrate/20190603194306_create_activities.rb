class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.boolean :event
      t.boolean :group
      t.datetime :event_date
      t.string :photo
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
