Rails.application.routes.draw do

  get 'users/new'

  # post "/search/:id", :to => "welcome#search"
  # You should not use the `match` method in your router without specifying an HTTP method.
  # If you want to expose your action to both GET and POST, add `via: [:get, :post]` option.
  # If you want to expose your action to GET, use `get` in the router:
  #   Instead of: match "controller#action"
  #   Do: get "controller#action"

  resources :sessions
  get "pick/:i" => "pick#show" # "attractions#show"
  get "attractions/pick" => "pick#show"
  # get "/boreds/:id", to: "boreds#show"
  # get "/hungries/:id", to: "hungries#show"
  resources :pick
  resources :attractions
  resources :directions
  # resources :boreds
  # resources :hungries
  devise_for :users

  get "/welcome/:id", to: "welcome#show"
  resources :welcome
  # post '/search' => 'welcome#search'

  root 'welcome#index'

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
