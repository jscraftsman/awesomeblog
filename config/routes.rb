Awesomeblog::Application.routes.draw do
  get "posts" =>"posts#index", :as => "posts"
  match "users/create_user" => "users#create_user", :via => :post
  match "users/login_user" => "users#login_user", :via => :post
  get "log_out" => "users#destroy", :as => "log_out"
  root :to => "users#index", :as => "index"
  resources :posts
  resources :users
end
