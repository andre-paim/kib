class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if @user.present? 
      @courses = Course.all.order("subject")
      if @user.id != session[:user_id]
        flash[:info] = "Nice Try."
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new
    user.first_name = params[:user][:first_name]
    user.last_name = params[:user][:last_name]
    user.email = params[:user][:email]
    user.program = params[:user][:program]
    user.graduation_year = params[:user][:graduation_year]
    user.password = params[:user][:password]
    user.time_registration = Time.now.to_i
    
    user_check = User.find_by(email: user.email)
    if user_check.present? or user.password != params[:user][:password_confirmation]
      if user_check.present?
        flash[:danger] = "Email already signed up! Please choose a different one."
      end
      if user.password != params[:user][:password_confirmation]
        flash[:warning] = "Passwords do not match! Please try again."
      end
      redirect_to "/users/new"
    else
      if user.save
        flash[:success] = "You signed up successfully!"
        user_signin = User.find_by(email: user.email)
        if user_signin.present?
          session[:user_id] = user_signin.id
        end
        redirect_to "/users/#{session[:user_id]}"
      else
        flash[:info] = "Something went wrong! Please try again."
        redirect_to "/users/new"
      end
    end
  end

  def index
    if !User.find_by(id: session[:user_id]).admin
      flash[:info] = "Nice Try."
      redirect_to "/"
    end
  end

end
