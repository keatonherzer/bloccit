Bloccit::Application.routes.draw do

  devise_for :users
  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'posts#index'

  root to: 'welcome#index'
end
