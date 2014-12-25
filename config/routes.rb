
Rails.application.routes.draw do

  ## Static Pages

  root 'application#home'
  get '/about' => 'application#about', as: :about
  get '/album' => 'application#album', as: :album
 
  ## Projects

  resources :projects, :only => [:show]
  get '/projects/:id/edit' => 'admin/projects#edit'

  ## Admin

  devise_for :users, :skip => [:sessions]
  as :user do
    get '/admin' => 'admin/projects#index'
    get 'admin/login' => 'devise/sessions#new', :as => :new_user_session
    post 'admin/login' => 'devise/sessions#create', :as => :user_session
    delete 'admin/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :admin do
    put 'projects/:id/move', to: 'projects#move', as: :move_project
    resources :projects, :except => [:show] do
      resources :project_details, :only => [:create, :destroy, :update]
    end
    resources :project_details, :only => [:edit, :update] do
      resources :images, :only => [:destroy, :update]
    end
  end

end
