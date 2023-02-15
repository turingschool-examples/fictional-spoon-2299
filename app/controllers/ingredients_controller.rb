class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.ordered_alphabetically
  end
end