class Recipe < ApplicationRecord
  has_many :recipe_ingredients 
  has_many :ingredients, through: :recipe_ingredients

  def ingredients_total_cost 
    ingredients.sum(:cost)
  end
end