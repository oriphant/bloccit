Rails.application.routes.draw do

  get 'comments/create'

  devise_for :users
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except:[:index] 
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    
    post '/up_vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
 
 
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  # get 'advertisement' =>'posts#advertisement'


  root to: 'welcome#index'
end
