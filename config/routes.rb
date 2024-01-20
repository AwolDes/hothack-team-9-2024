Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post '/add_tour', to: 'tours#create_tour'

  get "/tours" => "tours#index"
  get "/add_tour" => "tours#add_tour"

  # Defines the root path route ("/")
  root "hothacks#index"

  # Routes related to user authentication
  devise_for :users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup'
  }
  
  get "analytics" => "data_vis#data_view"

  # get "expenses"


  get "tours/:id/expenses" => "expenses#index"
  get "tours/:id/expenses/add" => "expenses#new"
  get "tours/:id/expenses/import" => "expenses#import"
  post "tours/:id/expenses" => "expenses#create"


  resources :expenses do
    collection {post :import}
  end

  # get "expenses/new" => "expenses#new"
  # get "tours/:id/expense/add" => "expense#new"

  # post "expenses" => "expense#create", as: expenses

  # get "tours/:id/expense/upload" => "expense#upload"
  # get "expense/upload" => "expense#upload"


  
end
