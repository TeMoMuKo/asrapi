json.array! locations do |location|
  json.id location.id
  json.latitude location.latitude.to_f
  json.longitude location.longitude.to_f
  json.message location.message
  json.address location.address
  json.country location.country
  json.country_code location.country_code

  json.image location.image_url
  json.created_at location.created_at
  json.updated_at location.updated_at
end
