Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses do
        resources :lessons
      end
    end
  end
end
