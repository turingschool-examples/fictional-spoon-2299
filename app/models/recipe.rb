class Recipe < ApplicationRecord
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, :complexity, :genre, presence: true

	def total_cost
		ingredients.sum(:cost)
	end
end