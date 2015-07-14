Rails.application.routes.draw do



  resources :posts, :advertisements
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'advertisement' =>'posts#advertisement'


  root to: 'welcome#index'
end
