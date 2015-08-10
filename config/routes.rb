Rails.application.routes.draw do

  get 'comments/create'

=begin
  get 'topics/index'
  get 'topics/new'
  get 'topics/show'
  get 'topics/edit'
  get 'question/index'
  get 'question/show'
  get 'question/new'
  get 'question/edit'
  get 'question/create'
  get 'question/update'
  get 'question/destroy'
  get 'question' => 'welcome#question'
=end
  
  devise_for :users
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except:[:index] do
      resources :comments, only: [:create, :destroy]
    end
  end
 
  resources :advertisements
 
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  # get 'advertisement' =>'posts#advertisement'


  root to: 'welcome#index'
end
