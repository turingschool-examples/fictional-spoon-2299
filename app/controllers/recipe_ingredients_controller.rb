class RecipeIngredientsController < ApplicationController
  def create
    recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    if recipe_ingredient.save
      redirect_to "/recipes/#{params[:recipe_id]}"
    else
      flash[:notice] = "Recipe Ingredient not added: Unknown Ingredient ID"
      redirect_to "/recipes/#{params[:recipe_id]}"
    end
  end

  private
  def recipe_ingredient_params
    params.permit(:recipe_id, :ingredient_id)
  end
end