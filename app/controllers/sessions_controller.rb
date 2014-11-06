class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you are now logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There is something wrong with your username or password"
      render :new
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "You've logged out - See you again soon"
    redirect_to root_path
  end
  
 
 
  private 
  
 
   
end