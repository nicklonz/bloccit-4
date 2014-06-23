# config/routes.rb

Bloccit4::Application.routes.draw do

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  get 'comments/create'

  devise_for :users

  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
