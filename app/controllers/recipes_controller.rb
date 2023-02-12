class RecipesController < ApplicationController
  
  def show 
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @cost = @recipe.sum_up
  end 
end 