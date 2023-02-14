class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @total_cost =  @ingredients.pluck(:cost).sum
  end
end