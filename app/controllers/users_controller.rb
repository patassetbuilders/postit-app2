class UsersController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_strong_params)
    @user.password = params[:user][:password]
    if @user.save
      flash[:notice] = "New User successfully created"
      binding.pry
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  
  
  def update
  end
  
  def destroy
  end
 
  private
  def user_strong_params
    params.require(:user).permit(:username, :password)
  end
  
end