class Public::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    @cooking_process = @recipe.cooking_process.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.customer_id = current_customer.id
    
    if @recipe.save
      redirect_to recipe_path
    else
      render action: :new
    end
    
  end

  def index
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :title, :process, ingredient_attributes: [:id, :ingredient_name, :quantity, :_destroy])
  end
  
end