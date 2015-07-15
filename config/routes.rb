Rails.application.routes.draw do


=begin
  get 'question/index'
  get 'question/show'
  get 'question/new'
  get 'question/edit'
  get 'question/create'
  get 'question/update'
  get 'question/destroy'
  get 'question' => 'welcome#question'
=end

  resources :posts, :advertisements, :questions
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  # get 'advertisement' =>'posts#advertisement'


  root to: 'welcome#index'
end
