Rails.application.routes.draw do
  scope :admin do
    resources :day_activities
    resources :activities
    resources :program_days
    resources :programs
    resources :categories
    resources :users do
      # This is only a get request for the sake of testing ease and prototyping. It would sit in api/v1 for app
      # post :enroll_to_program, on: :member
      get "/enroll_to_program/:program_id", to: "users#enroll_to_program"
    end
  end

  # /api/
  scope :api, constraints: { format: "json" } do
    # /api/v1/
    scope :v1 do
      resources :user_activity_completions, only: [ :show ] do
        post :mark_complete, on: :member
      end

      get "users/:user_id/program/:program_id/program_days/:program_day_id", to: "program_days#get_day_data"

      get "users/:user_id/program/:program_id", to: "program_days#current_day_data"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
