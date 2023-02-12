# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def cost
    ingredients.sum(:cost)
  end
end
