class PlayersController < ApplicationController
  def index
    if params[:match_id]
      @match = Match.find(params[:match_id])
      @players = @match.players.paginate(:page => params[:page], :per_page => 5)
    else
      @players = Player.all.paginate(:page => params[:page], :per_page => 5)
    end

  end

  def new
    @player = Player.new
  end

  def create
    allow_params[:match_id] = params[:match_id]
    @player = Player.new(allow_params)
    if @player.save
      Score.create(match_id: params[:match_id], game_id: params[:game_id])
      redirect_to game_tournament_match_players_path(params[:game_id], params[:tournament_id], params[:match_id])
    else
      render :new
    end
  end

  def update
    if @player = get_player

      if @player.update_attributes(allow_params)
        flash[:notice] = "player updated successfully"
        redirect_to players_path
      else
        render :edit
      end
    end

  end
 def show
   @player = get_player
 end
  def allow_params
    params.require(:player).permit!()
  end

  def get_player
    @player = Player.find(params[:id])
  end

  def edit
    @player = get_player
    if @player
      render :edit
    end 
  end

  def destroy
    if @player = get_player
      @player.destroy
     
      redirect_to players_path unless params[:game_id]
   
      
        redirect_to game_tournament_match_players_path(params[:game_id], params[:tournament_id],params[:match_id])if params[:game_id]
    end
  end

end
