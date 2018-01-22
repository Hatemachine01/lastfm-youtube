Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'usernames#new'
resources :usernames , only: [:new, :create , :index]


get '/display', :to => 'usernames#display', :as => 'display'
get '/shuttle', :to => 'usernames#shuttle', :as => 'shuttle'

	
end
