Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'usernames#new'
resources :usernames , only: [:new, :create]

get '/display', :to => 'usernames#display', :as => 'display'

	
end
