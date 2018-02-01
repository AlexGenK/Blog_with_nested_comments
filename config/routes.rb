Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments do
    resources :comments
  end
 
  resources :posts do
    resources :comments
  end

  resources :events

  resources :articles
   
  root to: 'posts#index'
end
