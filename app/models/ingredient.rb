class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.order_by_alpha
    Ingredient.order(:name)
  end
  
end