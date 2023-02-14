class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def total_cost
    cost_array = []

    ingredients.each do |ingredient|
      cost_array << ingredient.cost
    end
    
    return cost_array.sum
  end
end