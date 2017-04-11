json.(location, :id, :message, :team_id, :created_at, :updated_at, :address, :country, :country_code)
json.latitude location.latitude.to_f
json.longitude location.longitude.to_f
json.image location.image_url
json.team_number location.team.number
