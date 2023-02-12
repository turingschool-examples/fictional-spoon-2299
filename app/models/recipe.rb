# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true

  def cost
    ingredients.sum(:cost)
  end
end
