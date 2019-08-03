Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  mount Sidekiq::Web => '/sidekiq'
  root to: 'homes#home'
  resources :regions
  resources :counties
  resources :routes do
    member do
      get 'home'
      get 'data'
      get 'comments'
    end
  end
  get '/contact', to: 'homes#contact'
  post '/', to: 'homes#search'
  get '/:id/dashboard', to: 'dashboards#home', as: :user_dashboard
end
