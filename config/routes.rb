Rails.application.routes.draw do
  root 'page#index'
  namespace :admin do
    get "/", to: "dashboard#index"
  end
end
