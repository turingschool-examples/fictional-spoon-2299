class IngredientsController < ApplicationController
  def index
    @ingredient = Ingredient.find(params[:id])
    binding.pry
  end

  private
  def ingredient_params
    params.permit(:name, :cost)
  end
end