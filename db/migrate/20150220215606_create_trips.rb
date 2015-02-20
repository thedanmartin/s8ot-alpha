class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :date
      t.string :location
      t.string :opponent
      t.integer :fire_score
      t.string :opponent_score

      t.timestamps null: false
    end
  end
end
