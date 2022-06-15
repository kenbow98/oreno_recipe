class ApplicationController < ActionController::Base
  #devise利用の機能が使われる前にconfigure_permitted_parametersメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  #devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録の際に、ユーザー名のデータ操作を許可
  protected
  #privateは記述したコントローラー内でしか参照できない
  #protectedは呼び出された他のコントローラーからも参照できる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
