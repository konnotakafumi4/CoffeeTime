Rails.application.routes.draw do
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :end_users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :coffees, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :coffee_comment, only: [:create]
    end
    resources :coffee_comments, only: [:destroy]
  end

  root to: "public/homes#top"

  get "search" => "searches#search"

  devise_for :end_user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
