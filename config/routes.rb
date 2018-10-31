Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users
    root 'page#index'
    mount RailsAdmin::Engine => '/wp-admin', as: 'rails_admin'
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :follows, only: [:create, :destroy, :index]
    end
    resources :micro_posts
    resources :profiles, only: :show
    resources :locations
  end
end
