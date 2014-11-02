
Rails.application.routes.draw do

  ## Static Pages

  root 'application#home'
  get '/about' => 'application#about', as: :about

  ## Projects

  get '/projects/:id' => 'pages#show', as: :project

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
    resources :project_details, :only => [:destroy, :update]
  end

end
