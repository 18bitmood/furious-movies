class MoviesController < ApiController
  before_action :find_movie, only: %i[show update destroy]
  
  def create
    @movie = Movie.new(movie_params)
    #render json: @movie.errors unless @movie.save #render errors
    
    render_resource_errors @movie.errors unless @movie.save
    #byebug
  end

  def show
  end

  def update
  end

  def destroy
  end

  def index
  end

  def movie_details
  end

  def get_movies_from_api
    # Interactor or Job
    # No add if movie exist
    # Add links into contstant file
  end

  private 

  def movie_params
    params.permit(:name, :imdb_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
