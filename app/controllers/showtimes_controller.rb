class ShowtimesController < ApiController
  before_action :set_movie
  before_action :find_showtime, only: %i[show update destroy]
  
  def create
    @showtime = @movie.showtimes.build(showtime_params)
    render_resource_errors @showtime unless @showtime.save
  end

  def show
  end

  def update
    render_resource_errors @showtime.errors unless @showtime.update(showtime_params)
  end

  def destroy
    render_resource_errors @showtime.errors unless @showtime.destroy
  end

  def index
  end

  private 

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def find_showtime
    @showtime = @movie.showtimes.find(params[:id])
  end

  def showtime_params
    params.permit :movie_id, :showtime
  end
end
