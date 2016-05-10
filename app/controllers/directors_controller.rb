class DirectorsController < ApplicationController

  def index
    @directors = Director.all.order("name asc")
  end

  def show
    @director = Director.find_by(id: params[:id])
    if @director == nil
      redirect_to "/directors"
    end
  end
end
