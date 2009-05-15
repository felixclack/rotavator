ActionController::Routing::Routes.draw do |map|

  map.root :controller => "user_sessions", :action => "new"
  
  map.resources :positions
  map.resources :participations, :only => [:confirm, :decline], :member => {:confirm => :put, :decline => :put}
  map.resources :teams
  map.resources :rotas, :only => [:index, :new]
  map.resources :services do |service|
    service.resources :rota_formats do |rota_format|
      rota_format.resources :rotas
    end
  end
    
  map.resources :locations do |location|
    location.resources :rotas
    location.resources :services do |service|
      service.resources :rotas
    end
  end
  map.resources :rota_formats, :has_many => [:positions, :rotas]
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users, :has_many => [:participations, :rotas, :locations, :positions, :unavailabilities], :member => [:add_position, :add_location]
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  # Home Page
  map.dashboard "/dashboard", :controller => 'pages', :action => 'dashboard'
  map.root :controller => "pages", :action => 'dashboard'
end