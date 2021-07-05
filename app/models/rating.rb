class Rating < ApplicationRecord
  belongs_to :movie
  after_save :update_rating_parameters

  validates :mark, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }

  self.per_page = 10

  
  # To interactor
  def update_rating_parameters
    movie.average_rating = recount_average_rating
    #byebug
    movie.ratings_total_number = movie.ratings.count
    movie.save
  end

  def recount_average_rating
    movie_marks = movie.ratings.map(&:mark)
    return 0 if movie_marks.empty?

    (movie_marks.sum / movie_marks.count.to_f).round(2)
  end
end
