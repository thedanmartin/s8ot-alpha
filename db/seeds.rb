Supporter.create!([
  {name: "Hugo Stiglitz", years_traveling: 3, matches: 23, ejections: 4},
  {name: "Aldo Raine", years_traveling: 4, matches: 12, ejections: 0},
  {name: "Smithson Utivich", years_traveling: 2, matches: 8, ejections: 8},
  {name: "Archie Hicox", years_traveling: 5, matches: 30, ejections: 7},
  {name: "Andy Kagan", years_traveling: 3, matches: 18, ejections: 2}
])
Trip.create!([
  {date: "2015-03-01", location: "Bandersnatch, WI", opponent: "Snatchers", fire_score: 3, opponent_score: 2},
  {date: "2015-02-15", location: "Holler, MN", opponent: "Hollerbacks", fire_score: 4, opponent_score: 0},
  {date: "2015-02-01", location: "Logans Run, IN", opponent: "Sandmen", fire_score: 2, opponent_score: 2},
  {date: "2015-03-10", location: "Gobsmack, IL", opponent: "Pikers", fire_score: 2, opponent_score: 1}
])
Attendee.create!([
  {supporter_id: 1, trip_id: 1},
  {supporter_id: 4, trip_id: 1},
  {supporter_id: 2, trip_id: 3},
  {supporter_id: 3, trip_id: 3},
  {supporter_id: 1, trip_id: 3},
  {supporter_id: 5, trip_id: 1}
])
