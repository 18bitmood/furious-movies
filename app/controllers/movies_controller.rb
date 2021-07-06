class MoviesController < ApiController
  before_action :find_movie, only: %i[show update destroy details]

  def create
    @movie = Movie.new(movie_params)
    render_resource_errors @movie.errors unless @movie.save
  end

  def show; end

  def update
    render_resource_errors @movie.errors unless @movie.update(movie_params)
  end

  def destroy
    render_resource_errors @movie.errors unless @movie.destroy
  end

  def index
    @movies = movies.paginate(page: params[:page])
  end

  def details
    @response = FetchMovieDetails.run(movie: @movie).result
  end

  def update_prices
    movies.each do |movie|
      return render_resource_errors movie.errors unless movie.update(prices_params)
    end
  end

  def movies_with_details
    @movies = movies
    @result = @movies.map do |movie|
      details = FetchMovieDetails.run(movie: movie).result
      { movie: movie, details: details }
    end
  end

  private

  def movie_params
    params.permit(:name, :imdb_id, :price)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movies
    @movies ||= Movie.all.sort_by(&:id)
  end

  def prices_params
    params.permit(:price)
  end
end
