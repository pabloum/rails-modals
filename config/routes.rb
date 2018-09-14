Rails.application.routes.draw do
  devise_for :users
  resources :products
  root 'products#index'
  get 'alert_js', to: 'products#alert_js', as: 'alert_js'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
