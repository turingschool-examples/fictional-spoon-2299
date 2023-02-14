class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :cost, presence: true, numericality: true
  
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.order_alphabetically
    order(name: :asc)
  end
end