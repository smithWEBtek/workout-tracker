Rails.application.routes.draw do

  root "welcome#home"
  devise_for :users
  #devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

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
