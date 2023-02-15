class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    require 'pry'; binding.pry
    @recipe_ingredients = RecipeIngredient.find_ingredients(params[:id])
  end
end