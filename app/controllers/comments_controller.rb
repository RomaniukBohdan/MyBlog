class CommentsController < ApplicationController
  def create
    @post=Post.find(params[:post_id])
    @comment=current_user.comments.new(comment_param)
    @comment.post=@post
    @comment.save
    redirect_to post_path(@post)
  end

  private def comment_param
    params.require(:comment).permit(:username,:body)
  end
end
