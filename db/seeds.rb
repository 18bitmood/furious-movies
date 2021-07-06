movies_info = [
  { name: 'The Fast and the Furious', imdb_id: 'tt0232500', price: rand(1..5) * 100 },
  { name: '2 Fast 2 Furious', imdb_id: 'tt0322259', price: rand(1..5) * 100 },
  { name: 'The Fast and the Furious: Tokyo Drift', imdb_id: 'tt0463985', price: rand(1..5) * 100 },
  { name: 'Fast & Furious', imdb_id: 'tt1013752', price: rand(1..5) * 100 },
  { name: 'Fast Five', imdb_id: 'tt1596343', price: rand(1..5) * 100 },
  { name: 'Fast & Furious 6', imdb_id: 'tt1905041', price: rand(1..5) * 100 },
  { name: 'Furious 7', imdb_id: 'tt2820852', price: rand(1..5) * 100 },
  { name: 'The Fate of the Furious', imdb_id: 'tt4630562', price: rand(1..5) * 100 }
]

movies_info.each do |movie_info|
  movie = Movie.create(name: movie_info[:name], imdb_id: movie_info[:imdb_id], price: movie_info[:price])
  rand(5..15).times do
    Rating.create(movie_id: movie.id, mark: rand(1..5))
  end
  rand(2..5).times do |count|
    time = DateTime.now + count * 15.hours + rand(1..9).hours
    time = DateTime.now - rand(1..9).hours if count == 1
    time = time.change(min: 0)
    Showtime.create(movie_id: movie.id, showtime: time)
  end
end
