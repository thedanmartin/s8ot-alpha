json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :supporter_id, :trip_id
  json.url attendee_url(attendee, format: :json)
end
