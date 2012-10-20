Portfolio::Application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"



  # GET :blog -> blog#index
  # GET :blog/:id -> blog#show
  # GET :blog/:id/edit -> blog#edit
  # PUT :blog/:id -> blog#update
  # GET :blog/new -> blog#new
  # POST :blog -> blog#create
  # DELETE :blog -> blog#destroy
  resources :blog, :only => [:index, :show]
  resources :users
  resources :sessions


  namespace :admin do
  resources :posts
  resources :projects

  end

  #root :to => 'admin/posts#index'
  root :to => 'admin/projects#index'


end
