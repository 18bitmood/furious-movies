class MoviesController < ApiController
  require 'rest-client'
  before_action :find_movie, only: %i[show update destroy details]

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

  def details
    # ADD TO SEEDS THE LIST
    # To Constants
    # To interactor
    # Save apikey
    # http://www.omdbapi.com/?apikey=e4f33820
    # url = "http://www.omdbapi.com/"
    # apikey = "e4f33820"
    imdb_id = @movie.imdb_id
    # url = "http://www.omdbapi.com/?apikey=e4f33820&i=tt0232500"
    url = "http://www.omdbapi.com/?apikey=e4f33820&i=#{imdb_id}"
    @response = JSON.parse(RestClient.get(url))
  end

  def add_rating
    # need another model which will collect ratings
  end

  private

# CHECK UNPERMIT PARAMS
  def movie_params
    params.permit(:name, :imdb_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movies
    @movies ||= Movie.all
  end
end
