class RecipesController < ApplicationController
  
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end
  
  def show
    
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    if @recipe.save
      flash[:success] = "your recipes was created successfully"
      redirect_to recipes_path
      
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was updated successfully "
       redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    if like.valid?
      flash[:success] = "your selection was successful"
      redirect_to :back
    else
      flash[:danger] = "you can only like/dislike recipe once"
      redirect_to :back
    end
  end
  
  
  private
  
    def recipe_params
      params.require(:recipe).permit(:name,:summary, :picture)
    end
    
    def require_same_user
      if current_user != @chef
        flash[:success] = "you can only edit your own file"
        redirect_to root_path
      end
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
end