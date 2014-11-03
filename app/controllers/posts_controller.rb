class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
    
  def show
      @post = Post.find(params[:id])
      @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_strong_params)
    @post.user = User.first
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to posts_url
    else
      render :new
    end
  end
  
  def edit
    @post =Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_strong_params)
      redirect_to posts_url
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  def post_strong_params
    params.require(:post).permit(:title, :url, :description, category_ids:[])
  end
end
