# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  resources :fighters, only: %i(index show new create)
  resources :fights, only: %i(show new create) do
    member { post "start" }
  end
end
