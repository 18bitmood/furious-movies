json.total @total_count
json.ratings @ratings do |rating|
  json.partial! 'rating', rating: rating
end