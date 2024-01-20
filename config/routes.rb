Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "hothacks#index"

  get "analytics" => "data_vis#data_view"
  # CSV upload

  get "expenses" => "expenses#index"
  post "tour/:id/expenses/upload" => "expenses#create"

  get "expenses/upload" => "expenses#import_data"

  # http://localhost:3000/rails/info/routes
  # resources :expenses do
  #   collection {post :import}
  # end




end
