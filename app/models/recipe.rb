class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def total_cost
    binding.pry
    @recipe.ingredients
  end
end