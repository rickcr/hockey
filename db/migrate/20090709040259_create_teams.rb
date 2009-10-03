class CreateTeams < ActiveRecord::Migration
  def self.up
    teams = [ 
    "New Jersey Devils",
    "New York Islanders",
    "New York Rangers",
    "Philadelphia Flyers",
    "Pittsburgh Penguins",
    "Boston Bruins",
    "Buffalo Sabres",
    "Montreal Canadiens",
    "Ottawa Senators",
    "Toronto Maple Leafs",
    "Atlanta Thrashers",
    "Carolina Hurricanes",
    "Florida Panthers",
    "Tampa Bay Lightning",
    "Washington Capitals",
    "Chicago Blackhawks",
    "Columbus Blue Jackets",
    "Detroit Red Wings",
    "Nashville Predators",
    "St. Louis Blues",
    "Calgary Flames",
    "Colorado Avalanche",
    "Edmonton Oilers",
    "Minnesota Wild",
    "Vancouver Canucks",
    "Anaheim Ducks",
    "Dallas Stars",
    "Los Angeles Kings",
    "Phoenix Coyotes",
    "San Jose Sharks"]
    teams.each do | name | 
      team = Team.create(:name => name )
      team.save!
    end
  end
   
end
