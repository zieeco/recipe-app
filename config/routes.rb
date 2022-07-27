# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipe/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :recipes, :except [:update]
end
