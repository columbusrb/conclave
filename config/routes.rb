Conclave::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  ActiveAdmin.routes(self)

  get "comments/index"

  resources :users, :only => [:show, :index]

  resources :forums, :only => [:show, :index] do
    resources :conversations, :only => [:new, :create, :index]
  end

  resources :conversations, :except => [:new, :create, :index] do
    resources :comments, :except => [:show]
  end

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "forums#index"
end
