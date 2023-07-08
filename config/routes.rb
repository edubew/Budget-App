Rails.application.routes.draw do

  resources :categories do
    resources :records, only: [:index, :new, :create]
  end
  

  devise_for :users, skip: [:sessions]

  as :user do
    get 'login', to: 'sessions#new', as: :new_user_session
    post 'login', to: 'sessions#create', as: :user_session
    delete 'logout', to: 'sessions#destroy', as: :destroy_user_session
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'splash#splash'
end