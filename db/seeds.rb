# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
games = ["FIFA", "TENNIS", "BOXING","Basketball"]

players = ["Mohit","Ashvini","Sakshi","Devendra"]

tournaments = ["EPL","MLS","French Open","Sept'15"]
venues = ["LEEDS","NEW YORK","PARIS","LONDON","NEW DELHI","MUMBAI","PUNE","BANGLORE","KOLKATA","CHENNAI"]

games.each_with_index do |game,index|
  Game.find_or_create_by(name: game,description:"lets play the game", scoring_pts: "10")

end

players.each do |player|
  Player.find_or_create_by(name: player)
end

tournaments.each_with_index do |tournament, index|
  Tournament.find_or_create_by(game_id:index+1, name: tournament)
end

venues.each_with_index do |venue,index|
  Match.find_or_create_by(venue: venue, no_of_player: 2, played_on: 24/7/2015,game_id: index+1)
end




