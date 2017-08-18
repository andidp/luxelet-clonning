Rails.application.routes.draw do
  devise_for :users
  resources :properties
  resources :enquiries
  get 'dashboards/index'

  root to: 'dashboards#index'
end
