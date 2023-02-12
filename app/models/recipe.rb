class Recipe < ApplicationRecord

  has_many(:recipe_ingredients)
  has_many(:ingredients, through: :recipe_ingredients)

  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true

  def sum_up
    self.ingredients.sum(:cost)
  end
end