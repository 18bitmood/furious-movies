class MoviesController < ApiController
  before_action :find_movie, only: %i[show update destroy movie_description]

  def create
    @movie = Movie.new(movie_params)
    render_resource_errors @movie.errors unless @movie.save
  end

# ADD TIMES, PRICES AND RATINGS
  def show; end

  def update
    render_resource_errors @movie.errors unless @movie.update(movie_params)
  end

  def destroy
    render_resource_errors @movie.errors unless @movie.destroy
  end

  def index
    @movies = movies.paginate(page: params[:page])
    @total_count = movies.count
  end

  def movie_description
    # From API
    # To Constants
    # To interactor
    # Save apikey
    #http://www.omdbapi.com/?apikey=e4f33820
    url = "http://www.omdbapi.com/"
    apikey = "e4f33820"
    
  end

  def fetch_movies_from_api
    # ADD TO SEEDS THE LIST
    # CHECK INVALID IMDB_ID

    # Interactor or Job
    # No add if movie exist
    # Add links into contstant file
  end

  def add_rating
    # need another model which will collect ratings
  end

  private

  def movie_params # CHECK UNPERMIT PARAMS
    params.permit(:name, :imdb_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movies
    @movies ||= Movie.all
  end
end
