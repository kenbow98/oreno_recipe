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
      redirect_to recipes_path, flash: { notice: "「#{@recipe.title}」のレシピを投稿しました。"}
    else
      render action: :new
    end

  end

  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @recipe_comment = RecipeComment.new
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to 'recipes'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :title, :process, ingredient_attributes: [:id, :ingredient_name, :quantity, :_destroy])
  end

end