Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'static#homepage'
get '/display', :to => 'static#display', :as => 'display'
get '/next', :to => 'static#controls', :as => 'next'
get '/previous', :to => 'static#controls', :as => 'previous'
get '/lookup' , :to => 'static#homepage', :as => 'lookup_get'




post '/lookup' , :to => 'static#api_lookup', :as => 'lookup'


end
