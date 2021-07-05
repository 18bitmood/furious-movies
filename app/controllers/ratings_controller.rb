class RatingsController < ApiController
  before_action :set_movie

  def create
    @rating = @movie.ratings.build(rating_params)
    render_resource_errors @rating unless @rating.save
  end

  def index
    @ratings = @movie.ratings.paginate(page: params[:page])
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.permit :movie_id, :mark
  end
end
