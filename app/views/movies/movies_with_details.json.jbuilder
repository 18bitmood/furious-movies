json.total @movies.count
json.movies @result do |item|
  json.partial! 'movie', movie: item[:movie]
  json.details item[:details]
end
