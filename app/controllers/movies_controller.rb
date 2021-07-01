class MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    render json: @movie.errors unless @movie.save
  end

  def read
  end

  def update
  end

  def destroy
  end

  def index
  end

  private 

  def movie_params
    params.permit(:name, :imdb_id)
  end
end
