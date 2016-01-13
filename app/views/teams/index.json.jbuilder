json.array! @teams do |team|
  json.id team.id
  json.name team.name
  json.last_location team.last_location
end
