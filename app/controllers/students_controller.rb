class StudentsController < ApplicationController

  def new
    @student = Student.new
    @student.user_id = session[:user_id]
    @student.course_id = params[:course_id]
    @student.active = true
    @student.save
    
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
    @student = Student.find_by(id: params[:id])
    if params[:mode] == "add"
      @student.active = true
    elsif params[:mode] == "remove"
      @student.active = false
    end
    @student.save
    
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
