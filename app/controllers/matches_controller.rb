class MatchesController < ApplicationController
  #include Stats
   
  before_filter :require_user, :except => [ :index, :show ]
  
  def index
    @matches = Match.paginate :all, :page => params[:page], 
      :order => 'match_date DESC', :include => {:playergames => [:player,:team]} 
    
    
    #@games = Playergame.find(:all)
    #  gameStats( @games )
      
    #@matches = Match.find(:all, :include => {:playergames => :team})
    #@matches = Match.find(:all, :include => {:playergames => [:team,:player]})
   #@matches = Match.find(:all, :include => :playergames)
    #logger.debug "hash #{hash}"
    #ar = @games[0].methods
    #ar = @games[0].protected_methods
    #logger.debug "array size #{ar.length}"
    #logger.debug ar
    # ar.sort.each do |m| 
    #   logger.debug "array val=  #{m.to_s}" 
    # end
  end

  def show
    logger.info "--- Show"
    @match = Match.find(params[:id])
  end

  def new
    logger.info "--- New"
    @match = Match.new(:overtime => false, :shootout => false, :linechanges => true, :period_length => 20 )
    2.times { @match.playergames << Playergame.new(:shots => 10, :time_on_attack => 0)  } 
    #would just make one: @match.playergames.build
  end

  def edit
    logger.info "--- Edit"
    @match = Match.find(params[:id])
  end

  def create
    logger.info "--- Create"
    
    @match = Match.new(params[:match])
    if @match.save
      logger.info "--- match saved..."
      flash[:notice] = "Successfully created match."
      redirect_to(@match)
    else
      logger.info "--- match not saved action to new"
      render :action => 'new'
    end
  end

  def update
    logger.info "--- Update"
    #params[:match][:existing_game_attributes] ||= {}
     
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      flash[:notice] = 'Match was successfully updated.'
      redirect_to(@match) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    logger.info "--- Destroy"
    @match = Match.find(params[:id])
    
      @match.destroy
      redirect_to(matches_url) 
  end
end
