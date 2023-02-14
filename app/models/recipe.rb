class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def cost_of_ingredients
    ingredients.sum(:cost)
  end
end