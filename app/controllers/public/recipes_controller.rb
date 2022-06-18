class Public::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.customer_id = current_customer.id
    @recipe.save
    redirect_to recipe_path
  end

  def index
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :title, :caption)
  end
end
