Rails.application.routes.draw do

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

  resources :topics do
    resources :posts, except:[:index] do
      resources :summaries, only:[:show, :create, :edit, :new]
    end
  end
 
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  # get 'advertisement' =>'posts#advertisement'


  root to: 'welcome#index'
end
