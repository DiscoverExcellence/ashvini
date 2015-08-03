class TournamentsController < ApplicationController
  #before_filter :get_tournament
  def index
    @tournaments = Tournament.all
  end
def new
    @tournament = Tournament.new
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
  @tournament = Tournament.new(allow_params)

  if @tournament.save
    redirect_to tournaments_path
  else
    render :new
  end
end
  def dashboard
    @tournaments = Tournament.all
  end

  def destroy
    if @tournament = get_tournament
      @tournament.destroy
      redirect_to tournaments_path
    end
  end
  def update
    if @tournament = get_tournament

      if @tournament.update_attributes(allow_params)
        flash[:notice] = "Tournament updated successfully"
        redirect_to tournaments_path
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