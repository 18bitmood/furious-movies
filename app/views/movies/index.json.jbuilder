json.total @movies.count
json.movies @movies do |movie|
  json.partial! 'movie', movie: movie
end
