class Supporter < ActiveRecord::Base
  has_many :trips
  has_many :supporter_attendees, class_name: "Attendee"
end
