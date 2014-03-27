TrackAppTwo::Application.routes.draw do
  get "schools/new"
  get "schools/create"
  get "schools/index"
  get "schools/update"
  get "schools/delete"
  get "schools/edit"
  get "events_boys/new"
  get "events_boys/create"
  get "events_boys/index"
  get "events_boys/update"
  get "events_boys/edit"
  get "athletes/new"
  get "athletes/create"
  devise_for :coaches

  get "static/main"
  get "static/about"

  root 'seasons#index'

  resources :coaches do
    resources :athletes
    resources :schools
  end

  resources :seasons do
    resources :meets do
      resources :events_boys
      # resources :events_girls
      # resources :events
      # resources :one_hundred_meters
      # resources :eight_hundred_meter_ms
      # resources :four_hundred_hurdles_ms
      # resources :four_hundred_meter_ms
      # resources :one_hundred_meter_ms
      # resources :one_ten_hurdle_ms
      # resources :sixteen_hundred_meter_ms
      # resources :two_hundred_meter_ms
      # resources :two_mile_ms
    end
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
