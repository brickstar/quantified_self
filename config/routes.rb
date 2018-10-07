Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index, :show] do
        resources :foods, only: [:index], to: "meals#show"
      end
    end
  end
end
