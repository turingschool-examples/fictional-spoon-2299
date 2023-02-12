class RecipesController < ApplicationController 
  def show 
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.ingredients
  end
end