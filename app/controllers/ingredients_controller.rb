class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_alphabetical
  end
end