Rails.application.routes.draw do
  resources :settings
  resources :admins
  get 'all_settings', to: 'settings#all_settings', as: 'all_settings'

  resources :categories
  get 'categories_admin', to: 'categories#categories_admin', as: 'categories_admin'

  root 'categories#index'
end
