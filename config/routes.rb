Rails.application.routes.draw do
	namespace :api do
  		resources :addresses, only: [:index, :show, :create]
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
