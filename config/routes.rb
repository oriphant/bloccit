Rails.application.routes.draw do

  resources :posts
  get 'about' => 'welcome#about'
  get 'contact' => 'welcom#contact'

  root to: 'welcome#index'
end
