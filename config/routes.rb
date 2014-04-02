Bloccit::Application.routes.draw do

  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'posts#index'

  root to: 'welcome#index'
end
