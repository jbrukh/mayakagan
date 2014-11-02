
Rails.application.routes.draw do

  ## Root

  root 'pages#home'

  get '/projects/:id' => 'pages#show', as: :project
  get '/about' => 'pages#about', as: :about

  ## Admin

  devise_for :users, :skip => [:sessions]
  as :user do
    get '/admin' => 'admin/projects#index'
    get 'admin/login' => 'devise/sessions#new', :as => :new_user_session
    post 'admin/login' => 'devise/sessions#create', :as => :user_session
    delete 'admin/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :admin do
    resources :projects
    resources :project_details, :only => [:destroy]
  end

end
