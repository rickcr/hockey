class Playergame < ActiveRecord::Base
  include MyUtils
  
  fields do
    player_id :integer
    match_id :integer
    team_id :integer
    home :boolean
    score :integer
    shots :integer
    hits :integer
    face_offs :integer
    time_on_attack :time
    penalty_minutes :integer
    power_play_goals :integer
    power_plays :integer
    short_handed_goals :integer
    empty_net_goals :integer
    notes :string
    timestamps
  end
  
  validates_presence_of :player_id, :team_id, :time_on_attack
  validates_numericality_of :score, :shots, :hits, :face_offs
  
  belongs_to :match, :foreign_key => "match_id"
  belongs_to :player, :foreign_key => "player_id"
  belongs_to :team, :foreign_key => "team_id"
  
  def time_on_attack_display
    seconds_to_time self.time_on_attack
  end
  
  def time_on_attack_display=(display)
    self.time_on_attack = time_to_seconds display
  end
  
  def power_play_goals_display
    "#{power_play_goals.to_s}/#{power_plays}"
  end
  
  def power_play_goals_display=(display)
    pp = display.split("/")
    self.power_play_goals = pp[0]
    self.power_plays = pp[1]  
  end
  
end