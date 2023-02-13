class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients


  def total_cost
    ingredients.average(:cost).to_f
  end
end