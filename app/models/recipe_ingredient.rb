class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  
  def self.find_ingredients(recipe_id_param)
    found = where(recipe_id: recipe_id_param).map do |result|
      result.ingredient
    end
  end

  def self.total_cost(recipe_id_param)
    costs = find_ingredients(recipe_id_param).map do |ingredient|
      ingredient.cost
    end
    costs.sum
  end
end