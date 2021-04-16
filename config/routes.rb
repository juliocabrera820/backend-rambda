Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/authentication/sign_up', to: 'authentication#sign_up'
      get '/authentication/sign_in', to: 'authentication#sign_in'
      resources :courses do
        resources :lessons
      end
      resources :users do
        resources :courses
      end
      resources :sales, except: [:update, :destroy]
      resources :topics
    end
  end
end
