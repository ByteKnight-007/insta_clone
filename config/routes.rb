Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]

  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show]

  get 'home/about'

  get 'posts/myposts'
  resources :posts
  root "posts#index"
end
