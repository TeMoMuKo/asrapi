require "csv"

records = CSV.read("users.csv")
records.each do |record|
  user = User.find_or_create_by(email: record[2]) do |u|
    u.first_name = record[0]
    u.last_name = record[1]
    u.team = Team.find_or_create_by(name: "Team #{record[3]}")
  end
  user.send_confirmation_instructions
end
