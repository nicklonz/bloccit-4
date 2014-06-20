# config/routes.rb

Bloccit4::Application.routes.draw do

  devise_for :users

  resources :topics

  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
