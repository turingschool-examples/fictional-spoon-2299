class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients , through: :recipe_ingredients

#method to add ingredients for total cost calling
  # def add_ingredients

  # end
end  