class MoviesController < ApplicationController
  #before_action find movie only show update destroy
  
  def create
    @movie = Movie.new(movie_params)
    render json: @movie.errors unless @movie.save #render errors
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def index
  end

  def details
  end

  private 

  def movie_params
    params.permit(:name, :imdb_id)
  end
end
