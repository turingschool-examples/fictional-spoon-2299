class Ingredient < ApplicationRecord
  has_many(:recipe_ingredients)
  has_many(:recipes, through: :recipe_ingredients)

  validates :name, presence: true
  validates :cost, presence: true

  def self.alphabetize
    order(:name)
  end
end