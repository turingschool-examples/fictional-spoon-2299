class IngredientsController < ApplicationController
  def index
    # binding.pry
    @ingredients = Ingredient.all
  end

  private
  def ingredient_params
    params.permit(:name, :cost)
  end
end