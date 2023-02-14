class Recipe < ApplicationRecord
 has_many :recipe_ingredients
 has_many :ingredients, through: :recipe_ingredients

 def cost
  cost = 0
  ingredients = self.ingredients 
  ingredients.each do |ingredient|
    cost += ingredient.cost
  end
  cost
 end
end