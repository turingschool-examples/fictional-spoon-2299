class RecipesController < ApplicationController
  
  def show
    @recipe = Recipe.find(params[:id])
    @recipe.save
    @recipe.total_cost
  end

end