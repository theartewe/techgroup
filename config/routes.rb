Levant::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  #
  # Default English
  #
  root  :to         => 'home#index'
  match 'about'     => 'about#index'
  match 'services'  => 'services#index'
  match 'contact'   => 'contact#index'

  match 'news'             => 'news#index'
  match 'news/posts/:slug' => 'news#show'
  match 'news/search'      => 'news#search'
  match 'news/:category'   => 'news#category'

  match 'services/conversion-optimization' => 'services#conversion_optimization'
  match 'services/crisis-communication'    => 'services#crisis_communication'
  match 'services/media-buying'            => 'services#media_buying'
  match 'services/ppc-management'          => 'services#ppc_management'
  match 'services/seo-optimization'        => 'services#seo_optimization'
  match 'services/social-media'            => 'services#social_media'

  #
  # Arabic
  #
  match 'ar'            => 'home#index'
  match 'ar/about'      => 'about#index'
  match 'ar/services'   => 'services#index'
  match 'ar/contact'    => 'contact#index'

  match 'ar/news'             => 'news#index'
  match 'ar/news/posts/:slug' => 'news#show'
  match 'ar/news/search'      => 'news#search'
  match 'ar/news/:category'   => 'news#category'

  match 'ar/services/conversion-optimization' => 'services#conversion_optimization'
  match 'ar/services/crisis-communication'    => 'services#crisis_communication'
  match 'ar/services/media-buying'            => 'services#media_buying'
  match 'ar/services/ppc-management'          => 'services#ppc_management'
  match 'ar/services/seo-optimization'        => 'services#seo_optimization'
  match 'ar/services/social-media'            => 'services#social_media'

  # Generic
  post  'submit'    => "contact#submit"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
