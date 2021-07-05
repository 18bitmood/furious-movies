Rails.application.routes.draw do
  resources :movies, only: %i[create show destroy update index] do
    member { get 'details' }
  end
end
