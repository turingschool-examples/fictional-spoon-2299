class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @total_cost = @recipe.total_cost
  end
end