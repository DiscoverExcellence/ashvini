class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def allow_params
    params.require(:user).permit!()
  end

  def login
    p params[:user][:password]
    @user = User.find_by(email: params[:user][:email])
    p @user
    #p @user.authenticate(params[:user][:password])
    #    if session[:user_id] == nil
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:notice]="Wrong Email or Password"
      redirect_to root_path
    end
  end
  
  def display
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

end
