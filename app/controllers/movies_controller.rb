class MoviesController < ApiController
  before_action :find_movie, only: %i[show update destroy]

  def create
    @movie = Movie.new(movie_params)
    render_resource_errors @movie.errors unless @movie.save
  end

# partial for view, and add prices, ratings and times
  def show; end

  def update
    render_resource_errors @movie.errors unless @movie.update(movie_params)
  end

  def destroy
    render_resource_errors @movie.errors unless @movie.destroy
  end

  def index
    @movies = Movie.all.paginate(page: params[:page])
  end

  def movie_description
    # From API
  end

  def fetch_movies_from_api
    # Interactor or Job
    # No add if movie exist
    # Add links into contstant file
  end

  def add_rating
    # need another model which will collect ratings
  end

  private

  def movie_params
    params.permit(:name, :imdb_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
