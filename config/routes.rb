Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :home, only: %i[index]
  resources :cases, only: %i[index]
  resources :info, only: %i[index]
end
