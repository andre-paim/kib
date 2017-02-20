class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
    @teacher.user_id = session[:user_id]
    @teacher.course_id = params[:course_id]
    @teacher.active = true
    @teacher.save
    
    respond_to do |format|
      format.html do
        redirect_to "/users/#{session[:user_id]}"
      end
      format.js do
        render "update_new.js.erb"
      end
    end
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
    if params[:mode] == "add"
      @teacher.active = true
    elsif params[:mode] == "remove"
      @teacher.active = false
    end
    @teacher.save
  
    respond_to do |format|
      format.html do
        redirect_to "/users/#{session[:user_id]}"
      end
      format.js do
        render "update.js.erb"
      end
    end
  end
end
