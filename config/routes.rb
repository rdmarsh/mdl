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
  
  resources :organisations do
    resources :relationships
    resources :systems
  end
  
  resources :relationships
  
  resources :systems do
    resources :support_levels
    resources :service_levels
    resources :environments
    resources :network_interfaces
    resources :licenses
  end
  
  resources :support_levels
  resources :service_levels
  resources :environments
  
  resources :network_interfaces do
    resources :network_uses
  end
  
  resources :network_uses
  
  resources :licenses do
    resources :license_types
    resources :organisations
  end
  
  resources :license_types do
    resources :organisations
  end
  
  resources :device_models do
    resources :device_types
    resources :manufacturers
  end
  
  resources :device_types
  resources :manufacturers
  
  root 'staticpages#home'
  
  resources :onemdl_settings, :only => [:index, :edit]
  
  match '/onemdl_settings',      to: 'onemdl_settings#index',     via: 'get'
  match '/onemdl_settings/edit', to: 'onemdl_settings#edit',     via: 'get'
  
  match '/help',    to: 'staticpages#help',     via: 'get'
  match '/about',   to: 'staticpages#about',    via: 'get'
  match '/contact', to: 'staticpages#contact',  via: 'get'
  match '/faq',     to: 'staticpages#faq',      via: 'get'
end
