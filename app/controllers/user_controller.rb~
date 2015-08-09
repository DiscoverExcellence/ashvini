class UserController < ApplicationController
  def login
    @user = User.new

  end

  def allow_params
    params.require(:user).permit!()
  end
  def show
    p "hello"
    @user = User.where(allow_params).first
    p @user
    if @user
      redirect_to users_path
    else
      render root_path
    end
  end
  def display
  
  end


end
