Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :restaurants do
  #   collection do # peut affecter tous les restaus
  #     get :top
  #   end
  # end

  resources :reviews, only: [:destroy] #actions non nestés car member
  resources :restaurants do
    resources :reviews, only: [:new, :create] #actions nestés car collection

    collection do # peut affecter tous les restaus #n'a pas besoin d'id
      get :top
    end

    member do # correspond a 1 restau à la fois #j'ai besoin d'id
      get :chef
    end
  end


end
