json.(@team, :id, :name, :last_location)
json.team_number @team.number
json.users @team.users do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
end
