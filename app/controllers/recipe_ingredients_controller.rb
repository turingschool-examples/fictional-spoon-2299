class RecipeIngredientsController < ApplicationController 
  def create 
    recipe = Recipe.find(params[:id])
    RecipeIngredient.create!(create_params)
    redirect_to "/recipes/#{recipe.id}"
  end

  private 

  def create_params 
    params.permit(:recipe_id, :ingredient_id)
  end
end