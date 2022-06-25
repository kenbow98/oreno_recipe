class Public::CustomersController < ApplicationController
  def index
    customers = Customer.where.not(name: "ゲストユーザー").deleted
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        flash[:notice] = "会員情報の編集に成功しました"
        redirect_to public_customer_path(@user)
      else
        flash[:notice] = "会員情報の編集に失敗しました"
        render :edit
      end
  end

  private
  
  def customer_params
    params.require(:customer).permit(:nickname, :profile_image)
  end
  
  def ensure_guest_user
    @customer = Customer.find(params[:id])
    if @customer.name == "guestuser"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
end
