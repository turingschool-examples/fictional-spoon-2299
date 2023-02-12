class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.sort_by_name_alpha
  end
end