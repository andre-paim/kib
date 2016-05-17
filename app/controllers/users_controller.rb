class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      flash[:notice] = "Nice Try."
      redirect_to "/"
    end
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save

    redirect_to "/movies"
  end

  def index

  end

end
