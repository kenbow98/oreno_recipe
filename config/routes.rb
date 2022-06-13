Rails.application.routes.draw do

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
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
  end

end
