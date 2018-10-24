Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users
    root 'page#index'
    mount RailsAdmin::Engine => '/wp-admin', as: 'rails_admin'
    resources :users
  end
end
