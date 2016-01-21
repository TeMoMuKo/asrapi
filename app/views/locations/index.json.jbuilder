json.array! @locations do |location|
  json.location_id location.id
  json.team_id location.team_id
  json.latitude location.latitude
  json.longitude location.longitude
  json.message location.message

  json.created_at location.created_at
  json.updated_at location.updated_at
end
