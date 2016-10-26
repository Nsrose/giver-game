Rails.application.routes.draw do
  devise_for :users do
    get '/signup', to: 'users/registrations#new', as: 'new_user_registration'
  end
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'games#home'
  
  get '/games/home', to: 'games#home', as: 'games'
  get '/games/new', to: 'games#new', as: 'new_game'
  get '/games/play_index', to: 'games#play_index', as: 'play_index'
  post '/games/play_index', to: 'games#play_index', as: 'play_index_result'
  get '/games/tutorial', to: 'games#tutorial', as: 'tutorial_game'
  # get '/games/results/:id', to: 'games#results', as: 'results'
  # post '/games/results/:id', to: 'games#results', as: 'results'
  match '/games/results/:resource_id' => 'games#results', as: 'results', via: [:get, :post]
  post '/games/create', to: 'games#create', as: 'create_game'
  get '/games/play/:resource_id', to: 'games#play_game', as: 'play_game'
  get '/users/:id', to: 'users#profile', as: 'user_profile'
  get '/users/:id/games/edit/:resource_id', to: 'games#edit', as: 'edit_game'
  post '/users/:id/games/update/:resource_id', to: 'games#update', as: 'update_game'
  post '/games/check', to: 'games#check_if_played_and_reroute', as: 'check_played'
  get '/games/archive', to: 'games#archive', as: 'archive'
  get 'games/archive/:resource_id', to: 'games#archive_game', as: 'archive_game'
  
  
  resources :charities


#  get '/movies/:id/similar', to: 'movies#similar', as: 'search_directors'

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
