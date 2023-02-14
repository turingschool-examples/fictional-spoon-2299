class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all.order(name: :asc)
  end
end