Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'application#homepage'
post '/lookup' , :to => 'application#api_lookup', :as => 'lookup'


end
