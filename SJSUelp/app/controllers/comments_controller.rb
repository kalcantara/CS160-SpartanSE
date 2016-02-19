class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if @post.comments.create(comment_params)
      redirect_to @post,
                  notice: 'Comment was successfully created.'
      redirect_to @post,
else
end end
private
alert: 'Error creating comment'
  def comment_params
    params.require(:comment).permit(:author, :body)
end
end