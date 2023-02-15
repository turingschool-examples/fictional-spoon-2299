class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  
  def self.find_ingredients(recipe_param)
    where(recipe_id: recipe_param)
  end
end