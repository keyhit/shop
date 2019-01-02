Rails.application.routes.draw do
  resources :settings
  resources :admins
  get 'all_settings', to: 'settings#all_settings', as: 'all_settings'

  resources :categories do
    resources :products
  end
  get 'categories_admin', to: 'categories#categories_admin', as: 'categories_admin'
  get 'products_by', to: 'products#products_by', as: 'products_by'


  root 'categories#index'
end
