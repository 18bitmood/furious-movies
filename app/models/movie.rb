class Movie < ApplicationRecord
  validates_presence_of :name, :imdb_id
  validates_uniqueness_of :name, :imdb_id

  validates_length_of :name, :maximum => 255
  validates_length_of :imdb_id, :maximum => 64
end
