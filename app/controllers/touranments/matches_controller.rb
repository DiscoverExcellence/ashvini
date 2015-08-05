class MatchesController < ApplicationController
  def index
    @tournament_id = Tournament.where(params[:id]).first.id
    @matches = Match.where(tournament_id: @tournament_id)
  end
  def new
    @match = Match.new
  end

  def create
    if @match = Match.new(allow_params)
      if @match.save
        redirect_to root_path
      else
        render :new
      end
    end
  end
  def update
    if @match = get_match

      if @match.update_attributes(allow_params)
        flash[:notice] = "Match updated successfully"
        redirect_to matches_path
      else
        render :edit
      end
    end

  end
  def allow_params
    params.require(:match).permit!()
  end
  def get_match
    @match = Match.find(params[:id])
  end
  def edit
    @match = get_match
    @match.players.build
    @match.players.build
    if @match
      render :edit
    end 

  end
  def destroy
    if @match = get_match
      @match.destroy
      redirect_to matches_path
    end
  end
end
