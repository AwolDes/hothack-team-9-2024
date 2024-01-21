Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post '/add_tour', to: 'tours#create_tour'
  delete '/tours/:id/delete_tour', to: 'tours#delete_tour', as: "tour_delete"
  get "/tours" => "tours#index"
  get "/add_tour" => "tours#add_tour"

  # Defines the root path route ("/")
  root "tours#index"

  # Routes related to user authentication
  devise_for :users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup'
  }
  

  # Routes related to data visualization
  get "/tour/:id/analytics" => "data_vis#data_view", as: "data_viz"

  # Routes related to csv import for expenses 
  get "tours/:id/expenses" => "expenses#index", as: "tour_expenses"
  get "tours/:id/expenses/add" => "expenses#new"
  get "tours/:id/expenses/import" => "expenses#show", as: "expenses_import"
  post "tours/:id/expenses" => "expenses#create"
  

  resources :expenses do
    collection { post :import}
  end
  
end
