Procialize::Application.routes.draw do
  resources :answers


  resources :options


  resources :questions


  resources :surveys


  resources :custom_pages


  resources :feeds


  resources :assets


  resources :viewers


  resources :recommends


  resources :posts


  resources :attendees


  resources :speakers


  resources :downloadbles


  resources :tracks


  resources :events


  resources :event_days


  resources :feedbacks


  resources :questionables


  resources :conferences


  resources :recipients


  resources :messages


  resources :meeters


  resources :meetings



  #devise_for :users

  mount RailsAdmin::Engine => '/organizer', :as => 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks" }
  match '/accept/:meeting_id/:decision', :to => "meetings#accept", :as => "accept_meeting"
  match '/messages/focus/new/:id/(:message)/(:all)', :to => "messages#focussed_new", :as => "focussed_message"
  match '/mark_message/:message_id/:mark',:to=> 'messages#mark_message',:as=>"mark_message"
  match '/get_events',:to=>"events#get_events"
  match '/build_recommend',:to=>"welcome#build_recommend"
  match "/participate/:id",:to=>"custom_pages#participate_in_survey",:as=>"take_survey"
  match "/submit_survey_answer",:to=>"custom_pages#submit_survey_answer"
  match "/profile/:id",:to=>"welcome#user_profile",:as=>"profile"
  match "/follow/:user_id/:decision",:to=>"welcome#follow",:as=>"follow"
  match "/menu",:to=>"welcome#display_menu"

  match "/view_users",:to=>"welcome#view_all_users"

  match "/user_for_roles/:id",:to=>"welcome#user_based_on_roles",:as=>"user_roles"


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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
