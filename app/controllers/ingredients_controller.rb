class IngredientsController < ApplicationController
  def index 
    @ingredients = Ingredient.order_by_alpha
  end
end