Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'page#index'
  namespace :admin do
    get "/", to: "dashboard#index"
  end
end
