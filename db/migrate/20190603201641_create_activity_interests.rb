class CreateActivityInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_interests do |t|
      t.references :activity, foreign_key:true
      t.references :interest, foreign_key: true

      t.timestamps
    end
  end
end
