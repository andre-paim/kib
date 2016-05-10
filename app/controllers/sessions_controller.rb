class SessionsController < ApplicationController

  def new

  end

  def create
    the_user = User.find_by(email: params[:email])
    if the_user.present?
      if the_user.password == params[:password]
        session[:user_id] = the_user.id
        flash[:notice] = "Welcome back, " + the_user.name
        redirect_to "/"
      else
        flash[:notice] = "Ah-ah-ahh! You didn't say the magic word! Please try again."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "We don't have a user with that email address.  Please try again."
      redirect_to "/sessions/new"
    end

  end

  def destroy
    session[:user_id] = nil   # or reset_session
    flash[:notice] = "You are logged out. Goodbye!"
    redirect_to "/"
  end

end
