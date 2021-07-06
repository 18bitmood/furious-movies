class Movie < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :showtimes, dependent: :destroy

  validates_presence_of :name, :imdb_id
  validates_uniqueness_of :name, :imdb_id

  validates_length_of :name, maximum: 255
  validates_length_of :imdb_id, maximum: 64

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  self.per_page = 10

  def dollars_price
    return "$0.00" if price.nil?
    
    "$#{(price/100.to_f).round(2)}"
  end
end
