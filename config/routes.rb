Rails.application.routes.draw do
  
  root 'pages#home'

  namespace :admin do
    resources :projects
  end

end
