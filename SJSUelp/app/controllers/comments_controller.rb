class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		if @post.comments.create(comment_params)
		  redirect_to post_path(@post)
		  flash.notice= 'Comment was successfully created.'
		 
		else
		    redirect_to post_path(@post)
			flash.alert= 'Error creating comment'
			flash.alert= 'Please fill out the required fields'
		end 
	end
private
	def comment_params
		params.require(:comment).permit(:author, :body)
  end
end
