Rails.application.routes.draw do

  get 'cart/add'

  get 'cart/remove'

  get 'cart/checkout'
  
  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  root 'products#index'



  # root :to => "sessions#login"
  get "signup", to: "users#new"
  get "login", to: "sessions#login"
  post "login", to: "sessions#login_attempt"
  get "logout", to: "sessions#logout"
  get "home", to: "sessions#home"
  get "profile", to: "sessions#profile"
  get "setting", to: "sessions#setting"
  get "search", to: "products#search"

  get "products/all", to: "products#all"
  get "products/admin", to: "products#admin"
  get "users/admin", to: "users#admin"
  get "cart", to: "cart#add"
  post "/users/:id/edit", to: "users#update"
  get "register", to: "users#new"

  
  resources :photos

  resources :reviews

  resources :users do
    resources :reviews
  end
  resources :products do
    resources :search
    resources :carts
  end
  #this puts the reviews directory as subdirectory of products
  resources :products do
    resources :reviews
    resources :photos
  end

  resources :categories do
    resources :products
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
end
