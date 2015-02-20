json.array!(@trips) do |trip|
  json.extract! trip, :id, :date, :location, :opponent, :fire_score, :opponent_score
  json.url trip_url(trip, format: :json)
end
