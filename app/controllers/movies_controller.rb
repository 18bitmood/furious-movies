class MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie
    else
      render json: @movie.errors
    end
  end

  def read
  end

  def update
  end

  def destroy
  end

  private 

  def movie_params
    params.permit(:name, :imdb_id)
  end
end
