class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def add_ingredient(ingredient)
    self.ingredients << ingredient
  end
end