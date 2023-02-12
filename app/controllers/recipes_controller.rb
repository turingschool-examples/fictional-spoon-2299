class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    ring = RecipeIngredient.create!(recipe_id: params[:id], ingredient_id: params[:ingredientadd])
    redirect_to "/recipes/#{params[:id]}"
  end
end
