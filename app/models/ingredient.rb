class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, :cost, presence: true

  # scope :total_cost, -> { Ingredient.sum(:cost).to_f }

  def self.total_cost
    sum(:cost).to_f
  end
end