class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.find_ingredients(params[:id])
  end
end