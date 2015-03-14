class ChangeDateInTrips < ActiveRecord::Migration
  def change
    change_column :trips, :date, :date
    change_column :trips, :opponent_score, :integer
  end
end
