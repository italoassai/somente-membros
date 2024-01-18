Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check


    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

    devise_scope :user do
      get 'users/sign_out', to: 'devise/sessions#destroy'
    end







  resources :posts, only:[:new, :create, :index ]

  root "posts#index"
end
