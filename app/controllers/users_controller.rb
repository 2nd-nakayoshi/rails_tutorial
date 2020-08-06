class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規登録に成功しました"
      redirect_to @user
    else
      flash.now[:danger] = "登録に失敗しました"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:oage]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "退会しました"
    redirect_to action: :new
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
