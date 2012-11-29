Portfolio::Application.routes.draw do



  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"



  # GET :posts -> posts#index
  # GET :posts/:id -> posts#show
  # GET :posts/:id/edit -> posts#edit
  # PUT :posts/:id -> posts#update
  # GET :posts/new -> posts#new
  # POST :posts -> posts#create
  # DELETE :posts -> posts#destroy
  resources :posts
  resources :users
  resources :sessions
  resources :projects


  #root :to => 'admin/posts#index'
  #root :to => 'admin/projects#index'
  root :to => 'home#index'

end
