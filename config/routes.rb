Onemdl::Application.routes.draw do
  # pagination MUST be above nested resources or URLs will break
  
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
  resources :device_models do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :environments and nested resources
  resources :environments do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :service_levels and nested resources
  resources :service_levels do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :support_levels and nested resources
  resources :support_levels do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
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
  resources :organisations do
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
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :addresses do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :notes do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :license_types and nested resources
  resources :license_types do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :licenses do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :licenses and nested resources
  resources :licenses do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  
  ##############################################################################
  # :operating_systems and nested resources
  resources :operating_systems do
    get 'page/:page', :action => :index, :on => :collection
    
    resources :systems do
      get 'page/:page', :action => :index, :on => :collection
    end
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
