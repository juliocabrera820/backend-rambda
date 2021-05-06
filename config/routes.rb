Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/authentication/sign_up', to: 'authentication#sign_up'
      post '/authentication/sign_in', to: 'authentication#sign_in'
      resources :users do
        resources :courses do
          resources :lessons
        end
        resources :sales, except: [:update, :destroy]
        resources :topics
      end
      get '/courses/all', to: 'courses#all'
      get '/courses/search', to: 'courses#search'
    end
  end
end
