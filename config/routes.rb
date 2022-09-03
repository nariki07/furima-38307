Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  
  devise_scope :user do
    get 'identification', to: 'users/registrations#new_identification'
    post 'identification', to: 'users/registrations#create_identification'
  end
  
  root to: "items#index"
  resources :items do
    resources :orders, only: [:create, :index]
  end
end
