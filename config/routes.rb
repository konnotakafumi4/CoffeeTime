Rails.application.routes.draw do
  root to: "public/homes#top"

  get "search" => "searches#search"

  devise_for :end_user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :public do
    get 'homes/about'
    get 'coffees/time_line'
    resources :end_users, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :coffees, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy, :index]
      resource :coffee_comment, only: [:create, :edit]
    end
    resources :coffee_comments, only: [:destroy]
  end

  namespace :admin do
    get "/"=>"homes#top"

    resources :end_users, only: [:index, :show, :destroy] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :favorites
      end
    end
    resources :coffees, only: [:index, :show ,:destroy]
    resources :coffee_comments, only: [:destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
