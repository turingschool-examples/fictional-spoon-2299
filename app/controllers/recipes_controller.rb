class RecipesController < ApplicationController
  def show
    @recipes = Recipe.all
    # binding.pry
  end
end