class Showtime < ApplicationRecord
  belongs_to :movie

  validates_presence_of :showtime
  validates_uniqueness_of :showtime, scope: :movie_id

  self.per_page = 10

  def human_read
    showtime&.strftime('%B %d, %Y, %T')
  end
end
