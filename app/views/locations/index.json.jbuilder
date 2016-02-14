json.array! @locations do |location|
  json.id location.id
  json.latitude location.latitude
  json.longitude location.longitude
  json.message location.message

  json.created_at location.created_at
  json.updated_at location.updated_at
end
