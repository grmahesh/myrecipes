Rails.application.routes.draw do
  
  root 'pages#home'
  get '/home', to: 'pages#home'
  
  #get '/recipes', to: 'recipes#index'
  #get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  #post '/recipes', to: 'recipes#create'
  #et '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  #patch '/recipes/:id', to: 'recipes#update'
  #get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  #delete '/recipes/:id', to: 'recipes#destroy'
  
  resources :recipes do
    member do
      post 'like'
    end
  end
  

  get '/chefs', to: 'chefs#index'
  #get '/chefs/new', to: 'chefs#new', as: 'new_recipe'
  post '/chefs', to: 'chefs#create'
  get '/chefs/:id/edit', to: 'chefs#edit', as: 'edit_chef'
  patch '/chefs/:id', to: 'chefs#update'
  get '/chefs/:id', to: 'chefs#show', as: 'chef'
  delete '/chefs/:id', to: 'chefs#destroy'
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  
  get '/logout', to: 'logins#destroy' 
  
end
