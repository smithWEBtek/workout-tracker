Rails.application.routes.draw do

  devise_for :users
  root "welcome#home"
  get '/users/:id/current_workouts', to: "workouts#current_workouts"


  resources :users do
    resources :workouts
  end

  resources :muscles
  resources :days

  resources :workouts do
    resources :exercises
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
