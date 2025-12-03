Rails.application.routes.draw do
  devise_for :users

  resources :fills do
    collection do
      get "solid"
      get "gradient"
    end
  end

  resources :colors

  resources :swatches do
    collection do
      get "my"
    end

    member do
      get "fork"
    end
  end

  resources :projects do
    resources :swatches
  end

  resources :comments, only: [:create, :update, :destroy]

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :subscriptions, only: :create
      resources :swatches, only: [:index, :show]
    end
  end

  namespace :admin do
    resources :fills do
      collection do
        get "solid"
        get "gradient"
      end
    end

    resources :colors
    resources :swatches

    resources :projects do
      resources :swatches
    end

    resources :subscriptions
  end

  resources :subscriptions, only: :create

  get "language", to: "welcome#language"

  get "welcome/index"
  get "welcome/about"

  get "profile/show"
  get "profile/edit"
  patch "profile/update"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "welcome#index"
end
