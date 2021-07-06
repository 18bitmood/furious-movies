Rails.application.routes.draw do
  resources :movies, only: %i[create show update destroy index] do
    resources :ratings, only: %i[create index]
    resources :showtimes, only: %i[create show update destroy index]
    member { get 'details' }
  end
  post 'movies/update_prices', to: 'movies#update_prices'
end
