class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "ログインしました"
      # debugger
      log_in user
      redirect_to user
    else
      flash[:danger] = "ログインに失敗しました"
      render 'new'
    end
    
  end

  def destroy
    debugger
    log_out
    redirect_to root_path
  end
end
