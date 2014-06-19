# config/routes.rb

Bloccit4::Application.routes.draw do

  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
