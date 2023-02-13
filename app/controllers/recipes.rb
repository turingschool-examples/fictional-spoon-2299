class RecipesController < ApplicationController
  
  # def index
  # end

  def show
    @recipes = Recipe.all
  end
end