class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @total_cost = @recipe.add_ingredient_cost
  end
end