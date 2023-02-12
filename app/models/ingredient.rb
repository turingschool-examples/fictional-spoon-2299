class Ingredient < ApplicationRecord
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	validates :name, :cost, presence: true

	def self.sort_by_name
		order(:name)
	end
end