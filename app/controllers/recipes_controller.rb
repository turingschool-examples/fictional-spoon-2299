class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.find_ingredients(params[:id])
    @total_cost = RecipeIngredient.total_cost(params[:id])
  end
end