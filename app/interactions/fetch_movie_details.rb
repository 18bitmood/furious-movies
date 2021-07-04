class FetchMovieDetails < ActiveInteraction::Base
  object :movie

  def execute
    # move to constants and .env
    domain = 'http://www.omdbapi.com/'
    apikey = 'e4f33820'
    imdb_id = movie.imdb_id
    url = "#{domain}?apikey=#{apikey}&i=#{imdb_id}"
    result = JSON.parse(RestClient.get(url)) # rubocop:disable Lint/UselessAssignment
  end
end
