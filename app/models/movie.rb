class Movie < ApplicationRecord
  validates_presence_of :name, :imdb_id
end
