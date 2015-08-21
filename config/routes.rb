Rails.application.routes.draw do
  get 'bio_pic_pages/:id/new', :to => 'bio_pic_pages#new', :as => :new_bio_pic_page

  get 'bio_pic_pages/:id/edit', :to => 'bio_pic_pages#edit', :as => :edit_bio_pic_page

  get 'bio_pic_pages/:id/show', :to => 'bio_pic_pages#show', :as => :show_bio_pic_page

  patch 'bio_pic_pages/:id/update', :to => 'bio_pic_pages#update', :as => :update_bio_pic_page

  get '/projects', :to => 'projects#index', :as => :projects_index
  get '/projects/:id', :to => 'projects#show', :as => :project_show
  get '/skills', :to => 'skills#index', :as => :skills_index
  delete '/sessions', :to => 'sessions#destroy', :as => :destroy_session
  get 'typeahead' => 'skills#typeahead'


  root 'home#landing'

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

  resources :users
  resources :projects
  resources :skills do
    collection do
      get :show_by_category
    end
  end


  resources :categories


get '/auth/google_oauth2/callback', as: "google_oauth", to: 'sessions#create'







end
