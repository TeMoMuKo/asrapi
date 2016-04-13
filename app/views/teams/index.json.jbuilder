json.array! @teams do |team|
  json.id team.id
  json.name team.name
  json.team_number team.number
  json.last_location team.last_location, partial: "locations/location", as: :location
end
