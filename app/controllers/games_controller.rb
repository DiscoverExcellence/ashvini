class GamesController < ApplicationController
  before_filter :get_game
  #after_filter :display_msg
  def index
p "game"   
 @games = Game.all
    p @games
=begin
    if @game = Game.find(params[:id])
      @game.destroy
      render game_path
    end
=end
  end
  def get_game
    p params[:id]
    @game = Game.find(params[:id])
  end
  def new
    @game = Game.new
    @game.matches.build
  end

  def create
    if @game = Game.new(allow_params)
      if @game.save
        redirect_to root_path
      else
        render :new
      end
    end
  end
  def allow_params
    params.require(:game).permit!()
  end

  def edit
    if @game
      @game.matches.build
      @game.matches.build
       render :edit
    end 

  end
  
  def update
    if @game

      if @game.update_attributes(allow_params)
        flash[:notice] = "Game updated successfully"
        redirect_to games_path
      else
        render :edit
      end
    end

  end

  def destroy
    if @game 
      @game.destroy
      redirect_to games_path
    end
  end

end
