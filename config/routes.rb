Rails.application.routes.draw do
	devise_for :users, path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup" }

	resources :jobs do
		resources :job_apps
	end

	

	authenticated :user do
		root :to => "jobs#index", as: :authenticated_root
	end
	
	unauthenticated :user do
		root :to => "pages#home", as: :unauthenticated_root
	end
  
	match "/is/about", to: "pages#about", via: :get, as: :pages_about
  

end