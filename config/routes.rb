# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles

  get '/profiles/:id/fetch_username', to: 'profiles#fetch_username'
  get '/profiles/:id/fetch_description', to: 'profiles#fetch_description'

  get '/:id' => "shortener/shortened_urls#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
