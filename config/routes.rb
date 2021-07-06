Rails.application.routes.draw do
  resources :movies, only: %i[create show update destroy index] do
    resources :ratings, only: %i[create index]
    resources :showtimes, only: %i[create show update destroy index]
    member { get 'details' }
  end
  get 'all_movies', to: 'movies#movies_with_details'
  post 'update_all_prices', to: 'movies#update_prices'
end
