Rails.application.routes.draw do

  devise_for :users
  root "welcome#home"
  get '/users/:id/current_workouts', to: "workouts#current_workouts", as: 'current_workouts'


  resources :users do
    resources :workouts do
    end
  end

  resources :workouts do
    resources :exercises
  end

  resources :muscles
  resources :days
  #resources :exercises


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
