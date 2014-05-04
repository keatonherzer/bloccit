Bloccit::Application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      get '/up-vote' => 'votes#up_vote', as: :up_vote
      get '/down-vote' => 'vote#down_vote', as: :down_vote
    end
  end
  
  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'posts#index'
  get 'topics' => 'topics#index'

  root to: 'welcome#index'
end
