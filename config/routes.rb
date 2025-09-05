Rails.application.routes.draw do
  get "2532702", to: "embed#index", format: :js
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#index"
  resources :pages, path: "" do
    collection do
      get :features
      get :pricing
      get :subscriptions
      get :stats
    end
  end
  resources :blogs, only: [ :index, :show ]

  namespace :admins do
    resource :dashboard, only: [ :show ]
  end

  resources :users, only: [] do
    namespace :users, path: "" do
      resources :episodes do
        collection do
          post :skip_audio_file
        end
      end
      resources :notifications
      resources :subscriptions do
        collection do
          get :plans
          get :owner
          get :mastering_settings
          get :cohost_settings
        end
      end
      resources :directories
      resources :contributors
      resources :profiles do
        collection do
          get :referrals
        end
      end
      resource :dashboard, only: [ :show ]
      resource :stats, only: [ :show ] do
        collection do
          get :downloads
          get :locations
          get :achievements
          get :technologies
        end
      end
    end
  end
end
