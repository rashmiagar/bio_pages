Rails.application.routes.draw do
  get 'bio_pic_pages/:id/edit', :to => 'bio_pic_pages#edit', :as => :edit_bio_pic_page

  get 'bio_pic_pages/:id/show', :to => 'bio_pic_pages#show', :as => :show_bio_pic_page

  post 'bio_pic_pages/:id/update', :to => 'bio_pic_pages#update', :as => :update_bio_pic_page

  post '/projects/create', :to => 'projects#create', :as => :project_create
  get '/projects', :to => 'projects#index', :as => :projects_index
  get '/projects/:id', :to => 'projects#show', :as => :project_show
  get '/skills', :to => 'skills#index', :as => :skills_index
  delete '/user-skills/:id/remove', :to => 'user_skills#destroy', :as => :remove_user_skill
  delete '/sessions', :to => 'sessions#destroy', :as => :destroy_session
  delete '/users/projects/:id/remove', :to => 'user_projects#remove', :as => :remove_user_project
  get 'typeahead' => 'skills#typeahead'

  post '/user-skills/:id/update', :to => 'user_skills#update', :as => :update_user_skill
  post '/search/results', :to => 'search#search_results', :as => :search_result
  root 'home#landing'

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
