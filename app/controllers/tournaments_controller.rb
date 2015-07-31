class TournamentsController < ApplicationController
  #before_filter :get_tournament
  def index
    @tournaments = Tournament.all
  end

  def get_tournament
   @tournament = Tournament.find(params[:id])

  end
  def edit
   if get_tournament
       render :edit
    end 
  
  end
  def allow_params
    params.require(:tournament).permit!()
  end
  def create
    if @tournaments = Tournament.new(allow_params)
      if @tournaments.save
        redirect_to root_path
      else
        render :new
      end
    end
  end
  
  def dashboard
    @tournaments = Tournament.all
  end

  
  
  def show
  end

end
