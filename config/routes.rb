Rails.application.routes.draw do
  resources :settings
  get 'all_settings', to: 'settings#all_settings', as: 'all_settings'
  resources :categories

  root 'categories#index'
end
