class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = User.first
    if @comment.save

      flash[:notice] = "Comment added"
      redirect_to post_url(@post)
    else
      render 'posts/show'
    end
  end
  
end
