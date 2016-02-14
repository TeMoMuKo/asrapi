team = Team.create(name: "Team 1")
user = User.new(first_name: "Sebastian", last_name: "Aralkiewicz", email: "seba1@test.pl", password: "qweasdzxc")
user.skip_confirmation!
user.team = team
user.save!

user = User.new(first_name: "Sebastian", last_name: "Aralkiewicz", email: "seba2@test.pl", password: "qweasdzxc")
user.skip_confirmation!
user.team = team
user.save!

team = Team.create(name: "Team 2")
user = User.new(first_name: "Sebastian", last_name: "Aralkiewicz", email: "seba3@test.pl", password: "qweasdzxc")
user.skip_confirmation!
user.team = team
user.save!

user = User.new(first_name: "Sebastian", last_name: "Aralkiewicz", email: "seba4@test.pl", password: "qweasdzxc")
user.skip_confirmation!
user.team = team
user.save!
