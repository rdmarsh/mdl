Onemdl::Application.routes.draw do
  
  # routes for signup, login and logout pages
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  # storing user sessions
  resources :sessions
  resources :users
  
  resources :statistics
  resources :activities
  
  # site wide announcements
  resources :announcements
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement', via: :get
  
  resources :device_models do
    resources :systems
  end
  
  resources :device_types do
    resources :device_models
  end
  
  resources :environments do
    resources :systems
  end
  
  resources :license_types do
    resources :licenses
  end
  
  resources :licenses do
    resources :systems
  end
  
  resources :manufacturers do
    resources :device_models
  end
  
  resources :network_interfaces
  
  resources :network_uses do
    resources :network_interfaces
  end
  
  resources :operating_systems do
    resources :systems
  end
  
  resources :organisations do
    resources :license_types
    resources :licenses
    resources :operating_systems
    resources :systems
  end
  
  resources :relationships do
    resources :organisations
  end
  
  resources :service_levels do
    resources :systems
  end
  
  resources :support_levels do
    resources :systems
  end
  
  resources :systems do
    resources :network_interfaces
  end
  
  root 'staticpages#home'
  
  resources :onemdl_settings, :only => [:index, :edit]
  
  match '/onemdl_settings',      to: 'onemdl_settings#index',     via: 'get'
  match '/onemdl_settings/edit', to: 'onemdl_settings#edit',     via: 'get'
  
  match '/help',    to: 'staticpages#help',     via: 'get'
  match '/about',   to: 'staticpages#about',    via: 'get'
  match '/contact', to: 'staticpages#contact',  via: 'get'
  match '/faq',     to: 'staticpages#faq',      via: 'get'
end
