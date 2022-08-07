Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :coffees, only: [:new, :index, :show, :create]
    resources :favorites, only: [:index]
  end

  root to: "public/homes#top"

  devise_for :end_user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
