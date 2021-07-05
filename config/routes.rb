Rails.application.routes.draw do
  resources :movies, only: %i[create show destroy update index] do
    resources :ratings, only: %i[create index]
    member { get 'details' }
  end
end
