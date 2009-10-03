module MatchesHelper
  # don't need this now because of 2.3.2 rails includes accepts_nested_attributes_for 
  # def fields_for_game(game, &block)
  #     prefix = game.new_record? ? 'new' : 'existing'
  #     fields_for("match[#{prefix}_game_attributes][]", game, &block)
  #   end
  
  def playergame_tabindex
      #incr 
      @current_tab ||= 0
      @current_tab += @incr
      #logger.info("current_tab "+ @current_tab.to_s)
      @current_tab
      #result = @current_tab + game_index
  end
  
  def setupTabIndexing(initial, increment)
       #logger.info "initial = "+initial.to_s
       @incr = increment
       @current_tab = initial.to_i
       #@increment = increment
   end
end
