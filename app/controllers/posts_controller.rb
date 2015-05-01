class PostsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  
  
  def index
    @posts = Post.all.page(params[:page]).per(3)
  end
    
  def show
      @post = Post.find_by(slug: params[:id])
      @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_strong_params)
    @post.user = current_user
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
    @post = Post.find_by(slug: params[:id])
    if @post.update(post_strong_params)
      redirect_to posts_url
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  def vote
    @post = Post.find_by(slug: params[:id])
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
    
    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = 'Your vote was created'
         else
          flash[:error] = 'You can only vote once'
        end
        redirect_to :back
      end
      format.js
    end
  end
      
  
  private
  def post_strong_params
    params.require(:post).permit(:title, :url, :description, category_ids:[])
  end
end
