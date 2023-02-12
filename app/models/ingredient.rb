class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.sort_by_name_alpha
    order(name: :asc)
  end  
end