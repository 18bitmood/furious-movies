class Rating < ApplicationRecord
  belongs_to :movie
  after_save :update_average_rating

  validates :mark, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }

  def update_average_rating
    movie.average_rating = recount_average_rating
    movie.save
  end

  def recount_average_rating
    movie_marks = movie.ratings.map(&:mark)
    return 0 if movie_marks.empty?

    (movie_marks.sum / movie_marks.count.to_f).round(2)
  end
end
