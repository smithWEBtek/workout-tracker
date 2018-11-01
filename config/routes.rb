Rails.application.routes.draw do
  devise_for :users
  root "welcome#home"


  resources :muscles
  resources :days

  resources :workouts, only: [:index, :show, :create, :destroy, :update] do
    resources :exercises, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
