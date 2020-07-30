class ApplicationController < ActionController::Base
before_action :set_search
include SessionsHelper

   def set_search
        @search = Blog.ransack(params[:q])
        @blogs = @search.result(distinct: true)
   end
end
