Rails.application.routes.draw do

  ## Root

  root 'pages#home'

  ## Admin

  namespace :admin do
    devise_for :users, :skip => [:sessions]
    as :user do
      get 'login' => 'devise/sessions#new', :as => :new_user_session
      post 'login' => 'devise/sessions#create', :as => :user_session
      delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    end
    resources :projects
  end

end
