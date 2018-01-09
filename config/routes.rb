Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'static#homepage'
get '/display', :to => 'static#display', :as => 'display'



post '/lookup' , :to => 'static#api_lookup', :as => 'lookup'


end
