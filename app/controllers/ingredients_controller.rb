class IngredientsController < ApplicationController
  
  def index 
    @ingredients = Ingredient.alphabetize

    
  end
end 