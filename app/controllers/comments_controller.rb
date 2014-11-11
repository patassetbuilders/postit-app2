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
    vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    if vote.valid?
      flash[:notice] = 'Your vote was successfully recorded.'
    else
      flash[:error] = 'You can only vote on this item once!'
    end
    redirect_to :back
  end
  
end
