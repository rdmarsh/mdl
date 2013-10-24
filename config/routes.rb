Onemdl::Application.routes.draw do
  
  #put our concerns first
  concern :systemable do
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  # don't forget pagination MUST be above nested resources or URLs will break
  
  # routes home to root
  root 'staticpages#home'
  
  # static pages routing
  match '/help',    to: 'staticpages#help',     via: 'get'
  match '/about',   to: 'staticpages#about',    via: 'get'
  match '/contact', to: 'staticpages#contact',  via: 'get'
  match '/faq',     to: 'staticpages#faq',      via: 'get'
  
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
  resources :addresses do
    get 'page/:page', :action => :index, :on => :collection
  end
    
  ##############################################################################
  # :activities
  resources :activities do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :users and nested resources
  resources :users do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :manufacturers and nested resources
  resources :manufacturers do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :device_models do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :device_types and nested resources
  resources :device_types do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :device_models do
      get 'page/:page', :action => :index, :on => :collection
    end
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
  resources :relationships do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :organisations do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :organisations and nested resources
  resources :organisations, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :license_types do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :licenses do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :operating_systems do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :addresses do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :people do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    # resources :note do
  #     get 'page/:page', :action => :index, :on => :collection
  #   end
  end
  
  ##############################################################################
  # :license_types and nested resources
  resources :license_types, shallow: true do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :licenses do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :licenses and nested resources
  resources :licenses, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # operating_system_families and nested resources
  resources :operating_system_families, concerns: :systemable do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :operating_systems do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  resources :operating_systems do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :systems and nested resources
  resources :systems do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :network_interfaces do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :persons and nested resources
  resources :people do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :addresses and nested resources
  resources :addresses do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  ##############################################################################
  # :network_uses and nested resources
  resources :network_uses do
    get 'page/:page', :action => :index, :on => :collection

    resources :network_interfaces do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :network_interfaces
  resources :network_interfaces do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  resources :onemdl_settings, :only => [:index, :edit]
  
  match '/onemdl_settings',      to: 'onemdl_settings#index',    via: 'get'
  match '/onemdl_settings/edit', to: 'onemdl_settings#edit',     via: 'get'
end