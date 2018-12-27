Rails.application.routes.draw do
  resources :settings
  get 'all_settings', to: 'settings#all_settings', as: 'all_settings'
  root 'settings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
