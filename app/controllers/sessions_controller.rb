class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "ログインしました"
      # debugger
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
    
  end

  def destroy
    log_out
    flash[:danger] = "ログアウトしました"
    redirect_to login_path
  end
end
