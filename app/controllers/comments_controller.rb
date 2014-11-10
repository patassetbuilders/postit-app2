class CommentsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
    if @comment.save

      flash[:notice] = "Comment added"
      redirect_to post_url(@post)
    else
      render 'posts/show'
    end
  end
  
  def vote
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    flash[:notice] = 'Your vote was created'
    redirect_to :back
  end
  
end
