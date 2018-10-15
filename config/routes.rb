Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
  namespace :admin do
    get "/", to: "dashboard#index"
  end
end
