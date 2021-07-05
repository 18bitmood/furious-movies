json.total @showtimes.count
json.showtimes @showtimes do |showtime|
  json.partial! 'showtime', showtime: showtime
end
