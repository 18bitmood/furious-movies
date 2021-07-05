class RatingsController < ApiController
  before_action :get_movie
  
  def create
    #view
    @rating = @movie.ratings.build(rating_params)
    render_resource_errors @rating unless @rating.save
  end

  def index
    @ratings = @movie.ratings
    render json: @ratings #view
  end

  private 

  def get_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.permit :mark
  end
end
