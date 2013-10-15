Merchant::Application.routes.draw do
  
  resources :static_pages
  resources :users
  resources :sessions
  resources :addresses
  resources :products
  resources :order_items
  resources :orders do
    member do
      get :confirm
    end
  end
  root 'store#index', :as => "store"
  
  get "logout" => "sessions#destroy", as: "logout", via: :get
  get "login" => "sessions#new", as: "login", via: :get
  get "signup" => "users#new", as: "signup", via: :get

  get "about" => "static_pages#about", as: "about"
  get "contact" => "static_pages#contact", as: "contact"

  get 'browse/shoes' => 'products#shoes'
  get 'browse/foods' => 'products#foods'
  get 'browse/clothes' => 'products#clothes'
  get 'browse/cities' => 'products#cities'
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

