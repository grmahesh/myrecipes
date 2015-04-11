class ChefsController < ApplicationController
  
  before_action :set_chef, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  def new
    @chef = Chef.new
  end
  
  def create
     @chef = Chef.new(chef_params)
     if @chef.save
      flash[:success] = "your account has been created successfully"
      session[:chef_id]=@chef.id
      redirect_to recipes_path
      
     else
      render 'new'
     end 
  end
  
  def edit
    
  end
  
  def show
     @recipe = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end
  
  def update
    if @recipe.update(chef_params)
      flash[:success] = "Recipe was updated successfully "
       redirect_to chef_path(@chef)
    else
      render 'edit'
    end
  end
  
  private
  
    def chef_params
      params.require(:chef).permit(:name, :email, :password)
    end
    
    def set_chef
      @chef = Chef.find(params[:id])
    end
    
    def require_same_user
      if current_user != @chef
        flash[:success] = "you can only edit your own file"
        redirect_to root_path
      end
    end
end