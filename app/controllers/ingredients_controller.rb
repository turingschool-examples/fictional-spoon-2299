class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order_alphabetically
  end
end