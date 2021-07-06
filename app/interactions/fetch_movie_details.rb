class FetchMovieDetails < ActiveInteraction::Base
  object :movie

  def execute
    domain = ENV['DOMAIN']
    apikey = ENV['APIKEY']
    imdb_id = movie.imdb_id
    url = "#{domain}?apikey=#{apikey}&i=#{imdb_id}"
    result = JSON.parse(RestClient.get(url)) # rubocop:disable Lint/UselessAssignment
  end
end
