class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    if params[:ingredient].present?
      new_ingredient = Ingredient.find(params[:ingredient])
      RecipeIngredient.create!(recipe: @recipe, ingredient: new_ingredient)
    end
    @total_cost = @recipe.total_cost
  end
end