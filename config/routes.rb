Techgroup::Application.routes.draw do

  mount ActiveadminSettings::Engine => '/admin'

  ActiveAdmin.routes(self)
  
  match "change-locale" => 'locale#change_locale', :as => :change_locale
 
  scope "(:locale)", :locale => /en|ar/ do
    
    devise_for :admin_users, ActiveAdmin::Devise.config
    
    root  :to => 'home#index'
    
    #header
    resources :corporation, :except => [:new,:edit,:delete] do
      collection do
        match 'board-of-directors'    => 'corporation#board_of_directors',  :as => :board_of_directors
        match 'ceo-message'           => 'corporation#ceo_message',         :as => :ceo_message
        match 'clients'               => 'corporation#clients',             :as => :clients
        match 'corporate-partners'    => 'corporation#corporate_partners',  :as => :corporate_partners
      end
    end

    resources :companies,               :only => [:index, :show]
    resources :company_sections,        :only => [:show]
    resources :company_section_folders, :only => [:show]


    resources :portfolio, :except => [:new,:edit,:delete] do
      collection do
        match 'tech-group-projects'     => 'portfolio#projects',   :as => :projects
        match 'tech-group-operations'   => 'portfolio#operations', :as => :operations
      end
    end

    resources :media, :except => [:new,:edit,:delete] do
      collection do
        get 'search'
        match 'category/:category'   => 'media#category', :as => :category
      end
    end
   
    #footer
    resources :career, :except => [:new,:edit,:delete]
    match "terms-and-conditions" => 'flatpages#terms_and_conditions', :as => :terms_and_conditions
    match "privacy-policy" => 'flatpages#privacy_policy', :as => :privacy_policy
    match "feedback" => 'flatpages#feedback', :as => :feedback
    match 'contact'   => 'contact#index'
    
  end
  
  # Generic
  post  'submit'    => "contact#submit"
  
  match '*not_found', to: 'errors#error_404'
  
  match '500-error'     => 'errors#error_500'

end
