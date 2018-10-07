Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index, :show] do
        get '/foods', to: "meals#show"
        post '/foods/:id', to: "meals#create"
      end
    end
  end
end
