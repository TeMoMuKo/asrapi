user = User.new(first_name: "Sebastian", last_name: "Aralkiewicz", email: "seba@test.pl", password: "qweasdzxc")
user.skip_confirmation!
user.save!

team = Team.create(name: "Team 1")
user.team = team
user.save

team.locations.create(latitude: 21.37, longitude: 37.21)
team.locations.create(latitude: 37.21, longitude: 21.37)
