class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  
  def self.find_ingredients(recipe_param)
    found = where(recipe_id: recipe_param).map do |result|
      result.ingredient
    end
  end
end