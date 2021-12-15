Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate', defaults: { format: 'json' }
  post 'signup', to: 'users#create', defaults: { format: 'json' }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show]
      resources :short_urls do
        member do
          post :visit
        end
      end
    end
  end
end
