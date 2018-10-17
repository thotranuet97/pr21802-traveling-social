Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/aa-admin', as: 'rails_admin'
  scope "(:locale)", locale: /en|vi/ do
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users
    root 'page#index'
    namespace :admin do
      get "/", to: "dashboard#index"
      resources :cities
      resources :locations
    end
  end
end
