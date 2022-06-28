Rails.application.routes.draw do

  #ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

    #管理者用
  #URL /admin/sign_in ...
  devise_for :admins, contollers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
  end


  #顧客用
  #URL customers/sign_in ...
  scope module: :public do
    root 'homes#top'
    devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
    resources :customers, only: [:show, :edit, :destroy] do
      resource :relationships, only: [:create, :destroy]
        get 'followers' => 'relationships/followers', as: 'followers'
        get 'followings' => 'relationships/followings', as: 'followings'
    end
    resources :recipes, only: [:new, :index, :show, :create, :destroy] do
      resources :ingredients, only: [:create, :edit, :destroy]
      resources :cooking_process, only: [:create, :edit, :destroy]
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

end
