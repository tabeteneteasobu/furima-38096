Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :new, :create]
  end
end
