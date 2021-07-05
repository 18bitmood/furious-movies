class Showtime < ApplicationRecord
  belongs_to :movie

  validates_presence_of :showtime
  validates_uniqueness_of :showtime, scope: :movie_id
end
