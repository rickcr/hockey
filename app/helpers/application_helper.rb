# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include MyUtils
  
  def players_options
    Player.find(:all, :order => 'first_name ASC').collect { |p| [ "#{p.first_name} #{p.last_name}", p.id ] }
  end

  def teams_options
    Team.find(:all, :order => 'name ASC').collect { |t| [ t.name, t.id ] }
  end

  def seconds_to_time_display seconds
    seconds_to_time(seconds)
  end
end
