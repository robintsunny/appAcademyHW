Rails.application.routes.draw do
  resources :users, only: [:new,:create, :show]
  resources :bands, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resource :session, only: [:new, :create, :destroy]
  root to: "users#new"
end
