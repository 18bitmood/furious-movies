json.total @total_count
json.movies @movies do |movie| 
  json.partial! 'movie', movie: movie
end
