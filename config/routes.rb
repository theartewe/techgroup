Techgroup::Application.routes.draw do

  resources :media, :only => [:index,:show]

  resources :companies

  ActiveAdmin.routes(self)
  
  match "change-locale" => 'flatpages#change_locale', :as => :change_locale

  scope "(:locale)", :locale => /en|fr|ar/ do
    
    devise_for :admin_users, ActiveAdmin::Devise.config
    
    root  :to         => 'home#index'
    match 'about'     => 'about#index'
    match 'services'  => 'services#index'
    match 'contact'   => 'contact#index'

    match 'media/posts/:slug' => 'media#show'
    match 'media/search'      => 'media#search'
    match 'media/:category'   => 'media#category'

    match 'services/conversion-optimization' => 'services#conversion_optimization'
    match 'services/crisis-communication'    => 'services#crisis_communication'
    match 'services/media-buying'            => 'services#media_buying'
    match 'services/ppc-management'          => 'services#ppc_management'
    match 'services/seo-optimization'        => 'services#seo_optimization'
    match 'services/social-media'            => 'services#social_media'
    
    #flatpages
    match "privacy_policy" => 'flatpages#privacy_policy', :as => :privacy_policy
    match "terms_of_use" => 'flatpages#terms_of_use', :as => :terms_of_use
    match "about_us" => 'flatpages#about_us', :as => :about_us
    match "contact_us" => 'flatpages#contact_us', :as => :contact_us
    match "faq" => 'flatpages#faq', :as => :faq
    
    resources :porfolio, :only => [:index,:show]
  end
  
  # Generic
  post  'submit'    => "contact#submit"

end
