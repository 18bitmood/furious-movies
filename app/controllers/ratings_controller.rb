class RatingsController < ApiController
  before_action :get_movie
  
  def create
    @rating = @movie.ratings.build(rating_params)
    render_resource_errors @rating unless @rating.save
  end

  def index
    @ratings = @movie.ratings
    @total_count = @movie.ratings.count
  end

  private 

  def get_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.permit :movie_id, :mark
  end
end
