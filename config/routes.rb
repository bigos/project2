Rails.application.routes.draw do
  namespace :api do
    namespace :vi do
      resources :words do
      end

      resources :texts do

      end
    end

  end

  apipie
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
