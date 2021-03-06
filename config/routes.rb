Library::Application.routes.draw do

  resources :services

  resources :vendors

  resources :projects 
  
  get '/password',  to: 'home#password',  as: 'password'
  
  get '/assign/:id',  to: 'projects#assign',  as: 'assign'
  
  get '/project/status/:change',  to: 'projects#index'
 
  get '/assign/service/:id/:project_id',  to: 'projects#get_service_list'
  
  get '/project/change/status/:id/:change_to',  to: 'projects#change_status'
      
  get '/validate/:project_name',  to: 'projects#validate', as: 'validate'
  
  get '/invitations',  to: 'home#show_invitations', as: 'invitations'
  
  get '/user/validate',  to: 'admin#validate_user'
  
  get '/vendor/status/:change',  to: 'vendors#index'
  
  get '/vendor/change/status/:id/:change_to',  to: 'vendors#change_status'
  
  get '/service/validate',  to: 'services#validate_service'
  
  get '/vendor/validate',  to: 'vendors#validate_vendor'
  
  devise_for :users
  
  root :to => 'home#index'

  resources :admin do
      member do
	put 'update'
      end
  end
  
  resources :home do
      member do
	put 'update'
      end
  end
  

  #devise_for :users
  # config.action_mailer.default_url_options = { host: 'localhost:3000' }
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
