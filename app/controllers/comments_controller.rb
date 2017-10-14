class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.build(comment_params)
	end	

	def comments_params
		params.require(:comment).permit(:comment)
	end	
end
