json.(location, :id, :latitude, :longitude, :message, :team_id, :created_at, :updated_at, :address, :country, :country_code)
binding.pry
json.image location&.image&.file&.filename
json.team_number location.team.number
