Bloccit::Application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'posts#index'
  get 'topics' => 'topics#index'

  root to: 'welcome#index'
end
