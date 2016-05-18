class MoviesController < ApplicationController

  def destroy
    m = Movie.find_by(id: params[:id])
    m.delete
    redirect_to "/movies"
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    m = Movie.new
    m.title = params["movie"]["title"]
    m.runtime = params["movie"]["runtime"]
    m.mpaa = params["movie"]["mpaa"]
    m.year = params["movie"]["year"]
    m.image_url = params["movie"]["image_url"]
    m.plot = params["movie"]["plot"]
    m.save

    redirect_to "/movies"

  end


  def index
    @movies = Movie.all
  
    city = City.find_by(id: params[:id])    
    web_file = open("http://api.openweathermap.org/data/2.5/weather?q=#{city.name}&APIKEY=4ce6f502d38ddae567bf1702b05e168c&units=imperial")
    @json = JSON.parse(web_file.read())
    
  end

  def show
    @movie = Movie.find_by(id: params["id"])
  end

end
