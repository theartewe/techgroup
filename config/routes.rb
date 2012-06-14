Techgroup::Application.routes.draw do

  ActiveAdmin.routes(self)
  
  match "change-locale" => 'flatpages#change_locale', :as => :change_locale

  match 'corporation'   => 'corporation#index'   
  resources :companies, :except => [:new,:edit,:delete] do
    
  end
  resources :porfolio, :except => [:new,:edit,:delete]
  resources :media, :except => [:new,:edit,:delete] do
     get 'search'
     match 'media/:category'   => 'media#category'
  end
  match 'contact'   => 'contact#index'

  scope "(:locale)", :locale => /en|ar/ do
    
    devise_for :admin_users, ActiveAdmin::Devise.config
    
    root  :to => 'home#index'
    
    #header
   
    
    #footer
    resources :career, :except => [:new,:edit,:delete]
    match "terms-and-conditions" => 'flatpages#terms_and_conditions', :as => :terms_and_conditions
    match "privacy-policy" => 'flatpages#privacy_policy', :as => :privacy_policy
    match "feedback" => 'flatpages#feedback', :as => :feedback
    
  end
  
  # Generic
  post  'submit'    => "contact#submit"

end
