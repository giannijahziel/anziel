Rails.application.routes.draw do
  devise_for :users

  resources :jobs do
  	resources :job_apps
  end

  root 'jobs#index'

  get '/about', to: 'pages#about'

end
