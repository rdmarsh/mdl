Onemdl::Application.routes.draw do
  
  #put our concerns first
  concern :systemable do
    resources :systems, concerns: :pageable
  end
  
  concern :pageable do
    get 'page/:page', action: :index, on: :collection
  end
  
  # don't forget pagination MUST be above nested resources or URLs will break
  
  # routes home to root
  root 'staticpages#home'
  
  # static pages routing
  match '/help',    to: 'staticpages#help',     via: 'get'
  match '/about',   to: 'staticpages#about',    via: 'get'
  match '/contact', to: 'staticpages#contact',  via: 'get'
  match '/faq',     to: 'staticpages#faq',      via: 'get'
  match '/support', to: 'staticpages#support',  via: 'get'
  match '/tos',     to: 'staticpages#tos',      via: 'get'
  
  # routes for signup, login and logout pages
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  # storing user sessions
  resources :sessions
  
  # site wide announcements
  resources :announcements
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement', via: :get
  
  # statistics
  resources :statistics
  
  ##############################################################################
  # :addresses  
  resources :addresses, concerns: :pageable
    
  ##############################################################################
  # :activities
  resources :activities, concerns: :pageable
  
  ##############################################################################
  # :users and nested resources
  resources :users, concerns: :pageable
  
  ##############################################################################
  # :manufacturers and nested resources
  resources :manufacturers, concerns: :pageable do
    resources :device_models, concerns: :pageable
  end
  
  ##############################################################################
  # :device_types and nested resources
  resources :device_types, concerns: :pageable do
    resources :device_models, concerns: :pageable
  end
  
  ##############################################################################
  # :device_models and nested resources
  resources :device_models, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :environments and nested resources
  resources :environments, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :service_levels and nested resources
  resources :service_levels, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :support_levels and nested resources
  resources :support_levels, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :relationships and nested resources
  resources :relationships, concerns: :pageable do
    resources :organisations, concerns: :pageable
  end
  
  ##############################################################################
  # :organisations and nested resources
  resources :organisations, shallow: true, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :license_types,     concerns: :pageable
    resources :licenses,          concerns: :pageable
    resources :operating_systems, concerns: :pageable
    resources :addresses,         concerns: :pageable
    resources :people,            concerns: :pageable
    
    # resources :note do
  #     get 'page/:page', :action => :index, :on => :collection
  #   end
  end
  
  ##############################################################################
  # :license_types and nested resources
  resources :license_types, shallow: true, concerns: :pageable do
    resources :licenses, concerns: :pageable
  end
  
  ##############################################################################
  # :licenses and nested resources
  resources :licenses, shallow: true, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # operating_system_families and nested resources
  resources :operating_system_families, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :operating_systems, concerns: :pageable
  end
  
  resources :operating_systems, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :systems and nested resources
  resources :systems, concerns: :pageable do
    resources :network_interfaces, concerns: :pageable
    resources :consoles, concerns: :pageable
  end
  
  ##############################################################################
  # :persons and nested resources
  resources :people, concerns: :pageable
  
  ##############################################################################
  # :addresses and nested resources
  resources :addresses, concerns: :pageable
  
  ##############################################################################
  # :network_uses and nested resources
  resources :network_uses, concerns: :pageable do
    resources :network_interfaces, concerns: :pageable
  end
  
  ##############################################################################
  # :network_interfaces
  resources :network_interfaces, concerns: :pageable

  ##############################################################################
  # :consoles
  resources :consoles, concerns: :pageable
  
  resources :onemdl_settings, :only => [:index, :edit]
  
  match '/onemdl_settings',      to: 'onemdl_settings#index',    via: 'get'
  match '/onemdl_settings/edit', to: 'onemdl_settings#edit',     via: 'get'
end