Rails.application.routes.draw do
  get 'favorite_foods/index'
  namespace :api do
    namespace :v1 do
      get '/favorite_foods', to: "favorite_foods#index"
      resources :foods
      resources :meals, only: [:index, :show] do
        get '/foods', to: "meals#show"
        post '/foods/:id', to: "meals#create"
        delete '/foods/:id', to: "meals#destroy"
      end
    end
  end
end
