class PlayersController < ApplicationController
  def index
    if params[:match_id]
      @match = Match.find(params[:match_id])
      @game = Game.find(params[:game_id])
      @tournament = Tournament.find(params[:tournament_id]) if params[:tournament_id]
      @players = @match.players.paginate(:page => params[:page], :per_page => 5)
    else
      @players = Player.all.paginate(:page => params[:page], :per_page => 5)
      @scores = Score.where(match_id: params[:match_id])
    end

  end

  def new
    @match = Match.find(params[:match_id]) if params[:match_id]
    p @match
    @game = Game.find(params[:game_id]) if params[:game_id]
    p @game
    @tournament = Tournament.find(params[:tournament_id]) if params[:tournament_id]
    p @tournament
    @player = Player.new
    p @player
    @scores = @player.scores.build
  end

  def get_redirect
    if params[:game_id]

      redirect_to game_tournament_match_players_path(params[:game_id], params[:tournament_id], params[:match_id]) if params[:tournament_id]
      redirect_to game_match_players_path(params[:game_id], params[:match_id]) unless params[:tournament_id]
    end
    redirect_to players_path unless params[:game_id]
  end
  def create

    @player = Player.new(allow_params)


    allow_params[:user_id] = current_user.id



    if @player.save

      if params[:game_id]
        Score.create(match_id: params[:match_id], player_id: @player.id, points: 0) unless params[:tournament_id]
        Score.create(match_id: params[:match_id], tournament_id: params[:tournament_id],player_id: @player.id, points: 0) if params[:tournament_id]
        get_redirect
      end

    else
      flash[:alert] = @player.errors.full_messages[0]
      render :new
    end

  end

  def update
    if @player = get_player

      if @player.update_attributes(allow_params)
        flash[:notice] = "player updated successfully"
        get_redirect
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
    #@score = @player.scores.build
    @pts = Game.find(params[:game_id]).scoring_pts if params[:game_id]
    p @pts
    if @player
      render :edit
    end 
  end

  def destroy
    if @player = get_player
      unless params[:game_id]
      @player.destroy

      else 
        Score.where(match_id: params[:match_id], player_id: params[:id]).first.destroy unless params[:tournament_id]
        Score.where(match_id: params[:match_id],tournament_id: params[:tournament_id], player_id: params[:id]).first.destroy if params[:tournament_id]
      end
      flash[:notice] = "player deleted successfully"
      get_redirect
    end
  end

end
