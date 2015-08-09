class TournamentsController < ApplicationController
 
  def index
    @tournaments = Tournament.where(game_id: params[:game_id]).paginate(page: params[:page], per_page: 3) if params[:game_id]
  end
  def new
    @tournament = Tournament.new
  end
  
  def get_tournament
    @tournament = Tournament.find(params[:id])

  end
  
  def edit
    if get_tournament
      #render :edit
    end 
  end

  def allow_params
    params.require(:tournament).permit!()
  end

  def create
     @game = Game.find(params.require(:game_id))

     allow_params[:user_id] = current_user.id

     @tournament = @game.tournaments.build(allow_params)
     # @matches = @game.matches.build
     # @tournament.matches.build
     # allow_params[:game_id] = params[:game_id]
    # @tournament = Tournament.new(allow_params)
     
     if @tournament.save
    
       redirect_to game_tournaments_path(params[:game_id])
     else
      flash[:alert] = "Game already exist"
      render :new
     end
  end

  def dashboard
    @tournaments = Tournament.all
  end

  def destroy
   
    if @tournament = get_tournament
      @tournament.destroy
      redirect_to game_tournaments_path(params[:game_id])
    end
  end

  def update
    allow_params[:game_id] = params[:game_id]
    if @tournament = get_tournament

      if @tournament.update_attributes(allow_params)
        flash[:notice] = "Tournament updated successfully"
        redirect_to game_tournaments_path(params[:game_id])
      else
        render :edit
      end
    end

  end

  def show
    if get_tournament
      render :show
    end
  end


end
