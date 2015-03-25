class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :supporter, index: true
      t.belongs_to :trip, index: true

      t.timestamps null: false
    end
    add_foreign_key :attendees, :supporters
    add_foreign_key :attendees, :trips
  end
end
