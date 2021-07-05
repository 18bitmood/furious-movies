class RatingsController < ApiController
  before_action :get_movie
  
  def create
    #view
    @rating = @movie.ratings.build(rating_params)
    return render_resource_errors @rating unless @rating.valid?
  end

  def index
    @ratings = @movie.ratings
    @total_count = @movie.ratings.count
    #render json: @ratings #view
  end

  private 

  def get_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.permit :mark
  end

end
