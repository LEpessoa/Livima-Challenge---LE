Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  get 'manager/signin'

  get 'employees', to: 'employees#index'
  resources :employees

  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end