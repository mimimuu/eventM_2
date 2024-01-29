Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :participants, only: [:new]
  resources :events do
    resources :participants, only: [:index, :create]
  end
end
