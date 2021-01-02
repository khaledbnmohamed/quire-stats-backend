require 'resque/server'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount(Resque::Server.new, at: "/resque") if Rails.env.development?

  swagger_documentation_constraint = lambda do |_|
    !Rails.env.production?
  end

  constraints swagger_documentation_constraint do
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
  end
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      get 'retireve_acces_token', to: 'authentication#retireve_acces_token'
      resources :tasks
      resources :projects
    end
  end
end
