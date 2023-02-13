class IngredientsController < ApplicationController

  def index
    @indgredients = Ingredient.all
  end

  # def show
  # end
end