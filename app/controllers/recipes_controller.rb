class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.sort_alphabetically
    @cost = @recipe.cost
  end

  def update
    @ingredient = Ingredient.find(params[:ingredient_id])
    @recipe = Recipe.find(params[:id])
    @recipe.add_ingredient(@ingredient)
    redirect_to "/recipes/#{@recipe.id}"
  end
end