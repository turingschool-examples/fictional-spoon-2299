class IngredientsController < ApplicationController
  def index
    @all_ingredients = Ingredient.all
  end
end