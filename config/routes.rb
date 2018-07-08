Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Application Homepage
  get 'site/index'

  resources :clients
  resources :clienttypes
  resources :contacts
  resources :notes
  resources :keyvalues
  resources :users

  root 'site#index'
end
