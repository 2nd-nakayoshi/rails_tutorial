class ApplicationController < ActionController::Base
before_action :set_search
include SessionsHelper

   def set_search
        @search = Blog.ransack(params[:q])
        @blogs = @search.result(distinct: true)
   end

   private

   # ログイン済ユーザかどうか確認
   def logged_in_user
      unless logged_in?
         flash[:danger] = "ログインしてください"
         redirect_to login_url
      end
   end

end
