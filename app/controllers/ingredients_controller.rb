class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.alphabetical
  end

end