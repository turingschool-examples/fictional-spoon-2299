class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.total_cost
    Ingredient.sum(:cost)
  end
end