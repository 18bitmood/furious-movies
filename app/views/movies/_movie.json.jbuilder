json.extract! movie, :id, :name, :imdb_id, :price
json.rating do
  json.average_rating movie.average_rating
  json.total_votes movie.ratings_total_number
end
json.showtimes movie.showtimes.map(&:showtime_formatted)
