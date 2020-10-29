Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome/:first_name', to: 'welcome#show'
  
  
  
  resources :comments
  resources :gossips
  resources :teams
  resources :contacts
  resources :cities, only: [:show] 
  resources :users
end

  
  

 
  
 
  
