class Rating < ApplicationRecord
  belongs_to :movie
  after_save :update_rating_parameters

  validates :mark, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }

  self.per_page = 10

  private

  def update_rating_parameters
    UpdateRatingsParams.run(movie: movie)
  end
end
