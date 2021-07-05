class UpdateRatingsParams < ActiveInteraction::Base
  object :movie

  # count this params and save it to DB to avoid perfomance issue with many requests
  def execute
    movie.average_rating = recount_average_rating
    movie.ratings_total_number = movie.ratings.count
    movie.save
  end

  def recount_average_rating
    movie_marks = movie.ratings.map(&:mark)
    return 0 if movie_marks.empty?

    (movie_marks.sum / movie_marks.count.to_f).round(2)
  end
end
