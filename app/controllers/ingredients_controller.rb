class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_alphabetically
  end
end