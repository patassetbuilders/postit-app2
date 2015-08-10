class CategoriesController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :require_admin, only: [:new, :create]
  def index
    @categories = Category.all
  end
    
  def show
    @category = Category.find_by slug: params[:id]
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_strong_params)
    if @category.save
      flash[:notice] = "Category successfully created"
      redirect_to categories_url
    else
      render :new
    end
  end
  
  def edit
    @category =Category.find_by slug: params[:id]
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_strong_params)
      redirect_to categories_url
    else
      render :edit
    end
  end
  
  #def destroy
  #end
  
  private
  def category_strong_params
    params.require(:category).permit(:name)
  end
end
