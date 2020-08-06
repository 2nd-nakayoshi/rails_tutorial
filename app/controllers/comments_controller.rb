class CommentsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update, :destroy]
    before_action :correct_user, only: [:update]

    def create
        @comment = current_user.comments.build(comment_params)
        
        if @comment.save
            flash[:success] = "コメントを投稿しました"
        else
            flash[:danger] = "コメントの投稿に失敗しました"
        end
        redirect_to blog_path(id: @comment.blog.id)
    end

    def update
        @comment = Comment.find(params[:id])
        # debugger
        if @comment.update_attributes(comment_params)
            flash[:success] = "コメントを更新しました"
        else
            flash[:danger] = "更新に失敗しました"
        end
        redirect_to blog_path(@comment.blog_id)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @blog = Blog.find(@comment.blog_id)
        @comment.destroy
        flash[:success] = "コメントを削除しました"
        redirect_to blog_path(@blog)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :blog_id)
    end
end
