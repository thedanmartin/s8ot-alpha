class Trip < ActiveRecord::Base
  has_many :supporters
  has_many :trip_attendees, class_name: "Attendee"
end
