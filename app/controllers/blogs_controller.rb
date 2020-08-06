class BlogsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]


  def index
    if params[:q] !=nil && params[:q][:created_at_gteq].present? && params[:q][:created_at_lteq].present? && params[:q][:title_or_content_or_user_name_cont_all].present?
      params[:q]['title_or_content_or_user_name_cont_all'] = params[:q]['title_or_content_or_user_name_cont_all'].split(/[\p{blank}\s]+/)
    end
      @blogs = Blog.ransack(params[:q]).result(distinct: true).page(params[:page]).per(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to action: :show, id: @blog.id
      flash[:success] = "記事を投稿しました"
    else
      flash.now[:danger] = "記事の投稿に失敗しました"
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @user = User.find_by(id: @blog.user_id)
    @comments = @blog.comments
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:success] = "記事を更新しました"
      redirect_to action: :show, id: @blog.id
    else
      flash.now[:danger] = "記事の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "記事を削除しました"
    redirect_to action: :index
  end

  private
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end


