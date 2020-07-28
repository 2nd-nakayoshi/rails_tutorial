class BlogsController < ApplicationController
  def index
    if params[:q] !=nil
    # @blogs = Blog.all
      params[:q]['title_or_content_cont_all'] = params[:q]['title_or_content_cont_all'].split(/[\p{blank}\s]+/)
    end
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to action: :show, id: @blog.id
      flash[:success] = "記事を登録しました"
    else
      flash[:denger] = "記事の登録に失敗しました"
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
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
      flash[:denger] = "記事の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to action: :index
  end
end

def blog_params
  params.require(:blog).permit(:title, :content)
end