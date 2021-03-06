Iimbvista2015::Application.routes.draw do
  resources :items

  resources :products

  resources :schedule_items

  get "shop_at_vista/index"

  get "shop_at_vista/checkout"

  get "shop_at_vista/payment_complete"

  post "shop_at_vista/payment_success"

  get "shop_at_vista/save_address"

  get "shop_at_vista/product_info/:id", :controller => "shop_at_vista", :action => "product_info"
 
  get "shop_at_vista/add_to_cart"
  
  get "shop_at_vista/remove_from_cart"
  
  get "api/auth_user"

  get "dashboard/index"
  
  get "dashboard/event_registrations/:id", :controller => "dashboard", :action => "event_registrations"

  get "dashboard/college_registrations/:id", :controller => "dashboard", :action => "college_registrations"

  resources :bulletins

  post "registrations/register"

  get "myevents/home"

  get "myevents/information/:id", :controller => "myevents", :action => "information"

  resources :event_tabs

  resources :events

  resources :event_categories

  get "events/for_event_category/:id", :controller => "events", :action => "for_event_category"
  
  get "event_tabs/for_event/:id", :controller => "event_tabs", :action => "for_event"

  get "events/my_events"
  
  get "backend/index"

  devise_for :users

  get "home/index"

  get "home/acco_n_travel"

  get "home/schedule"

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
