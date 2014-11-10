class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update]
  
  def show 
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_strong_params)
    @user.password = params[:user][:password]
    if @user.save
      flash[:notice] = "New User successfully created"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(current_user)
    if @user.update(user_strong_params)
      flash[:notice] = "User successfully updated"
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
  end
 
  private
  def user_strong_params
    params.require(:user).permit(:username, :password)
  end
  
  def require_same_user
    if current_user[:id] != params[:id].to_i
      flash[:error] = "You cannot edit another user's profile"
      redirect_to root_path
    end
  end
  
end