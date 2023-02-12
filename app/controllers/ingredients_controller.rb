class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_alphabetically_by_name
  end
end