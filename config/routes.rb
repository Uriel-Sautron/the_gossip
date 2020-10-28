Rails.application.routes.draw do

 
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  
  get '/welcome/:first_name', to: 'welcome#show'

  get '/user:user_id', to: 'welcome#user' 

  resources :gossips
  resources :teams
  resources :contacts

end
