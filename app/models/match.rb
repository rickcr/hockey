class Match < ActiveRecord::Base
  fields do
    match_date :datetime
    overtime :boolean, :default => false
    shootout :boolean, :default => false
    linechanges :boolean, :default => false
    period_length :integer
    game_version :string
    notes :string
  end
  
  has_many :playergames, :dependent => :destroy
  
  accepts_nested_attributes_for :playergames 
  
  #validates_associated :playergames
  validates_presence_of :match_date, :period_length
  
  #validate :valid_players? 

  #after_update :save_playergames
  
  # validates_each :playergames do |o,a,v|
  #       v.each_with_index do |game, index|
  #         game.errors.each { |ek,ev| o.errors.add "Player game record #{index+1}  #{ek}", ev } unless game.valid?
  #       end 
  #   end
   
  # def new_playergame_attributes=(game_attributes)
  #     logger.info "---M existing game attributes called"
  #     game_attributes.each do |game|
  #       playergames.build(game)
  #     end
  #   end
  #   
  #   def existing_playergame_attributes=(game_attributes)
  #     logger.info "---M existing game attributes called"
  #     playergames.reject(&:new_record?).each do |game|
  #       attributes = game_attributes[game.id.to_s]
  #       if attributes
  #         game.attributes = attributes
  #       else
  #         game.delete(game)
  #       end
  #     end
  #   end
  
  # def save_playergames
  #    playergames.each do |game|
  #      game.save(false)
  #    end
  #  end

  # def after_validation
  #       #self    .errors.delete(:playergames)
  #       playergames.each_with_index do |game, i|
  #       game.validate
  #       game.errors.each_full do |msg|
  #       self.errors.add_to_base "Player game record #{i+1}  #{msg}"
  #      end
  #     end
  #   end
  
  private
  
    def valid_players?
      unless playergames[0].player_id != playergames[1].player_id
        errors.add_to_base( "Players selected for home and away must be different.") 
      end
      unless playergames[0].home != playergames[1].home  
        errors.add_to_base( "A single team must be selected as the home team.")
      end
    end

end
