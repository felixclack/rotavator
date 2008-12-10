ActionController::Routing::Routes.draw do |map|

  map.resources :positions
  #map.resources :participations
  map.resources :teams
  map.resources :rotas, :only => [:new]
  map.resources :services, :only => [:index]
  map.resources :locations, :has_many => [:services, :rotas]
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  map.resource :account, :controller => "users"
  map.resources :users, :has_many => [:participations, :rotas, :locations, :positions]
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  # Home Page
  map.dashboard "/dashboard", :controller => 'pages', :action => 'dashboard'
end