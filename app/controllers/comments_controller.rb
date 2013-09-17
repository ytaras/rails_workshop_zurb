class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create!(comment_params.merge(user: current_user))

    redirect_to @post, notice: 'Comment added'
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comment)
  end
end
