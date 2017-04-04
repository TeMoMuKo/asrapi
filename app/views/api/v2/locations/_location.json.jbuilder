json.(location, :id, :latitude, :longitude, :message, :team_id, :created_at, :updated_at, :address, :country, :country_code)
json.image asset_url(location.image_url)
json.team_number location.team.number
