class CommentsController < ApplicationController

    def create
        @comment = current_user.comments.build(comment_params)
        
        if @comment.save
            flash[:success] = "コメントを投稿しました"
            redirect_to blog_path(id: @comment.blog.id)
            
        else
            flash.now[:danger] = "コメントの投稿に失敗しました"
            redirect_to controller: :blogs, action: :index
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :blog_id)
    end
end
