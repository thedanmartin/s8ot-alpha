class Attendee < ActiveRecord::Base
  belongs_to :supporter, inverse_of: :supporter_attendees
  belongs_to :trip, inverse_of: :trip_attendees



end
