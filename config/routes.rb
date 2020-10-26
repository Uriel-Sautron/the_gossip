Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/welcome', to: 'welcome#welcome'
  
  get '/welcome/:first_name', to: 'welcome#show'
  
  get '/team',to: 'team#team'

  get '/contact', to: 'contact#contact'

  get '/gossip:gossip_id', to: 'welcome#gossip'

  get '/user:user_id', to: 'welcome#user' 

end
