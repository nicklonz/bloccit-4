# config/routes.rb

Bloccit4::Application.routes.draw do

<<<<<<< HEAD
=======
  get 'comments/create'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

>>>>>>> comments
  devise_for :users

  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
