class RecipeIngredientsController < ApplicationController
  def create
    RecipeIngredient.create!(recipe_ingredient_params)
    redirect_to "/applications/#{params[:recipe_id]}"
  end

private
  def recipe_ingredient_params
    params.permit(:recipe_id, :ingredient_id)
  end
end