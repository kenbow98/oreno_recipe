Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followers'
    get 'relationships/followings'
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
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    resources :customers, only: [:show, :edit, :destroy] do
      resource :relationships, only: [:create, :destroy]
        get 'followers' => 'relationships/followers', as: 'followers'
        get 'followings' => 'relationships/followings', as: 'followings'
    end
    resources :recipes, only: [:new, :index, :show] do
      resources :ingredients, only: [:create, :edit, :destroy]
      resources :cooking_process, only: [:create, :edit, :destroy]
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end

end
