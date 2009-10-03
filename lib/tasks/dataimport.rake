require 'fastercsv'

namespace :dataimport do
  task(:cvsimport  => :environment) do
    
    rickid = Player.find(:first, :conditions => "first_name='Rick'").id
    steveid = Player.find(:first, :conditions => "first_name='Steve'").id
    
    puts "iterating over csv file..."
     
    FasterCSV.foreach("#{RAILS_ROOT}/hockey.csv") do |row|
       
      match = Match.new 
      rick_game = Playergame.new(:match_id => match.id)
      steve_game = Playergame.new(:match_id => match.id)
      
      match.match_date = row[0].to_date
      
      rick_game.player_id = rickid
      steve_game.player_id = steveid
 
      rick_team_name = row[1] 
      steve_team_name = row[2]

      #puts "team names set.. rick_team_name=#{rick_team_name}, steve_team_name=#{steve_team_name}"

      steve_game.team_id = Team.find(:first, :conditions => "name='#{steve_team_name}'").id
      #puts "steve_team_id = #{steve_game.team_id}"

      rick_game.team_id = Team.find(:first, :conditions => "name='#{rick_team_name}'").id
      #puts "rick_team_id = #{rick_game.team_id}"

      #p1_id = p1_name.casecmp("rick") == 0 ? rickid:steveid
      #p2_id = p2_name.casecmp("rick") == 0 ? rickid:steveid

      home_player_name = row[3]
      #puts "home_player_name = #{home_player_name}"

      if home_player_name.casecmp("rick") == 0
        rick_game.home = true
      else 
        steve_game.home = true 
      end 
      #puts "rick home = #{rick_game.home}" 
      
      rick_game.score = row[4].to_i
      steve_game.score = row[5].to_i
      
      parse_powerplays_and_populate(row[6], rick_game)
      parse_powerplays_and_populate(row[7], steve_game)
      
      rick_game.shots = row[8].to_i
      steve_game.shots = row[9].to_i
      
      rick_game.hits = row[10].to_i
      steve_game.hits = row[11].to_i
      
      rick_game.time_on_attack = time_to_sec(row[12])
      steve_game.time_on_attack = time_to_sec(row[13]) 
      
      rick_game.face_offs = row[14].to_i
      steve_game.face_offs = row[15].to_i
      
      match.shootout = get_bool_value row[16] 
      match.notes = row[17]
      match.overtime = get_bool_value row[18]   
      match.linechanges = get_bool_value row[19] 
      
      rick_game.penalty_minutes = row[20].to_i
      steve_game.penalty_minutes = row[21].to_i
      
      rick_game.short_handed_goals = row[22].to_i
      steve_game.short_handed_goals = row[23].to_i 
      
      match.playergames << rick_game
      match.playergames << steve_game

      match.period_length = 20 
      
      match.save
      #rick_game.save
      #steve_game.save
      
      #puts "added games to match"
      #puts " playegame 1  = #{match.playergames[0]}" 
    end
    
    puts "iteration complete"
  end
  
  def parse_powerplays_and_populate(p, player)
    arr = p.split("/");
    player.power_play_goals = arr[0].to_i
    player.power_plays = arr[1].to_i
  end
  
  def time_to_sec time_display  
     seconds = time_display.split(':').inject(0){|sum, timeunit| sum = sum * 60 + timeunit.to_i}  
  end
  
  def get_bool_value val
    return val.casecmp("yes") == 0
  end
end
