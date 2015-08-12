class GamesController < ApplicationController

  def get_game
    @game = Game.find(params[:id])
  end
  def index
    @games= Game.all.paginate(:page => params[:page], :per_page => 5)

  end
  def new
    @game = Game.new
    @game.matches.build
  end

  def create
    if @game = Game.new(allow_params)
      if @game.save
        redirect_to games_path(params[:game_id])
      else
        flash[:alert] = @game.errors.full_messages[0]
        p "exists"
        render :new
      end
    end
  end
  def allow_params
    params.require(:game).permit!()
  end

  def edit
    @game = get_game
    if @game
      # @game.matches.build
      #@game.matches.build


    end 

  end
  def show 
    @game = get_game


  end
  def update
    if @game = get_game

      if @game.update_attributes(allow_params)
        flash[:notice] = "Game updated successfully"
        redirect_to games_path
      else
        flash[:alert] = @game.errors.full_messages[0]
        render :edit
      end
    end

  end

  def destroy
    if @game = get_game
      @game.destroy
      redirect_to games_path
    end
  end

end
