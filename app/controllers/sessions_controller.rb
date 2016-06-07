class SessionsController < ApplicationController

  def new

  end

  def create
    the_user = User.find_by(email: params[:email])
    if the_user.present?
      if the_user.authenticate(params[:password])
        session[:user_id] = the_user.id
        flash[:success] = "Welcome back, " + the_user.first_name + "!"
        redirect_to "/"
      else
        flash[:warning] = "Wrong password! Please try again."
        redirect_to "/sessions/new"
      end
    else
      flash[:warning] = "We don't have a user with that email address.  Please try again."
      redirect_to "/sessions/new"
    end

  end

  def destroy
    session[:user_id] = nil   # or reset_session
    flash[:info] = "You are logged out. Goodbye!"
    redirect_to "/"
  end

end
