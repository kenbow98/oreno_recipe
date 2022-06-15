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
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    put 'customers/information' => 'customers#update'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    resources :recipes, only: [:new, :index, :show]
    
    get 'followers' => 'relationships/followers', as: 'followers'
    get 'followings' => 'relationships/followings', as: 'followings'

  end

end
