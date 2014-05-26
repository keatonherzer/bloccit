Bloccit::Application.routes.draw do

  get "posts/index"
  devise_for :users
  resources :users, only: [:show, :index, :update]
  resources :posts, only: [:index]
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]
      get '/up-vote' => 'votes#up_vote', as: :up_vote
      get '/down-vote' => 'vote#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end
  
  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'posts#index'
  get 'topics' => 'topics#index'

  root to: 'welcome#index'
end
