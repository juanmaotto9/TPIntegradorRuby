Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :questions do
    	resources :answers
  	end
  	put 'questions/:id/resolve', to: 'questions#resolve'
  	resources :users, only: :create
  	resources :sessions, only: :create

end
