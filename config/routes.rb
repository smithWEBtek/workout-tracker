Rails.application.routes.draw do
  devise_for :users
  resources :muscles
  resources :days
  resources :exercises
  resources :workouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
