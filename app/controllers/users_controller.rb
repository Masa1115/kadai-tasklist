class UsersController < ApplicationController
before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @list = current_user.lists.find_by(id: params[:id])
    unless @list
     redirect_to root_path
    end
  end
end
